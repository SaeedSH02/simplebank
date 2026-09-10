package util

import (
	"math/rand"
	"strings"
)

const alphabet = "abcdefghijklmnopqrstuvwxyz"

// RandomInt generate a random integer between min and max
func RandomInt(min, max int64) int64 {
	return min + rand.Int63n(max-min+1)
}

// RandomString generate a random string of lenth n
func RandomString(n int) string {
	var sb strings.Builder
	k := len(alphabet)

	for i := 0; i < n; i++ {
		c := alphabet[rand.Intn(k)]
		sb.WriteByte(c)
	}
	return sb.String()
}

// RondomOwner generates a random owner name
func RondomOwner() string {
	return RandomString(6)
}

// RondomMoney generates a random amount og money
func RondomMoney() int64 {
	return RandomInt(0, 1000)
}

// RondomCurrency generates a random currency code
func RandomCurrency() string {
	currencies := []string{"EUR","USD", "CAD"}
	n := len(currencies)
	return currencies[rand.Intn(n)]

}