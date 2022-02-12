package main

import (
	"context"
	"log"
	"math/rand"
	"net/http"

	"github.com/syncapod/tart/example/protos"
	"github.com/twitchtv/twirp"
)

var (
	colors = []string{"red", "blue", "green", "purple", "black"}
	types  = []string{"fedora", "panama", "derby", "boater", "bowler"}
)

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

func main() {
	h := haberdasherService{}
	s := protos.NewHaberdasherServer(&h)
	err := http.ListenAndServe(":8080", s)
	if err != nil {
		log.Fatalln("http.ListenAndServe error:", err)
	}
}
