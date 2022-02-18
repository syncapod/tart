package main

import (
	"context"
	"fmt"
	"log"
	"math/rand"
	"net/http"

	"github.com/syncapod/tart/example/protos"
	"github.com/twitchtv/twirp"
)

const (
	authTokenHeaderKey = "Auth-Token"
)

var (
	colors = []string{"red", "blue", "green", "purple", "black"}
	types  = []string{"fedora", "panama", "derby", "boater", "bowler"}
)

type authTokenCtxKey struct{}

type haberdasherService struct{}

// MakeHat produces a hat of mysterious, randomly-selected color!
func (h *haberdasherService) MakeHat(ctx context.Context, size *protos.Size) (*protos.Hat, error) {
	if size.Inches < 1 {
		return nil, twirp.InvalidArgumentError("Inches", "Cannot be less than 1")
	}
	return &protos.Hat{
		Inches: size.Inches,
		Color:  getRandom(colors, 5),
		Name:   getRandom(types, 5),
	}, nil
}

// MakeSuit produces a suit of perfect proportions, with random color
func (h *haberdasherService) MakeSuit(ctx context.Context, req *protos.SuitSizeReq) (*protos.Suit, error) {
	return &protos.Suit{
		Size:  req.Size,
		Color: getRandom(colors, 5),
	}, nil
}

func getRandom(slice []string, max int) string {
	random := rand.Intn(max)
	return slice[random]
}

// withAuthTokenCtx is middleware that extracts the auth token header and inserts it into the context
func withAuthTokenCtx(base http.Handler) http.Handler {
	return http.HandlerFunc(func(res http.ResponseWriter, req *http.Request) {
		val := req.Header.Get(authTokenHeaderKey)
		req = req.WithContext(context.WithValue(req.Context(), authTokenCtxKey{}, val))

		base.ServeHTTP(res, req)
	})
}

// authorizeRequest takes a context, extracts an authToken and if not valid returns an error
func authorizeRequest(ctx context.Context) (context.Context, error) {
	authToken := ctx.Value(authTokenCtxKey{})
	if authToken == nil || authToken != "SuperSecretAPIKey" {
		return ctx, twirp.Unauthenticated.Error("Invalid Auth Token")
	}
	fmt.Println("Successfully Authenticated Request")
	return ctx, nil
}

func main() {
	h := haberdasherService{}
	s := protos.NewHaberdasherServer(&h, twirp.WithServerHooks(
		&twirp.ServerHooks{
			RequestReceived: authorizeRequest,
		},
	))

	err := http.ListenAndServe(":8080", withAuthTokenCtx(s))
	if err != nil {
		log.Fatalln("http.ListenAndServe error:", err)
	}
}
