package main

import (
	"fmt"
	"net/http"
	"sync"
	"time"
)

// Create wait group to sync go subroutines
var wg sync.WaitGroup

func getWebsite(website string, cc bool) {

	// Check if it should run in concurrent mode
	if cc {
		defer wg.Done()
	}

	if res, err := http.Get(website); err != nil {
		fmt.Println(website, "is down")

	} else {
		fmt.Printf("[%d] %s is up\n", res.StatusCode, website)
	}
}

func runSynchronous(websites []string) {

	for _, website := range websites {
		getWebsite(website, false)
	}
}

func runConcurrent(websites []string) {

	for _, website := range websites {

		// go creates go subroutine for concurrency
		go getWebsite(website, true)
		wg.Add(1)
	}

	// Wait for all subroutines to finish executing
	wg.Wait()
}

func main() {
	fmt.Println("go concurrency sample... \n")
	prnt := fmt.Println

	websites := []string{
		"https://stackoverflow.com/",
		"https://github.com/",
		"https://www.linkedin.com/",
		"http://medium.com/",
		"https://golang.org/",
		"https://www.udemy.com/",
		"https://www.coursera.org/",
		"https://wesionary.team/",
		"https://urbanpistek.com",
	}

	// Non-concurrent
	prnt(" Non-concurrent: \n")
	start := time.Now()
	prnt("start: ", start)

	runSynchronous(websites)

	end := time.Now()
	elapsed := end.Sub(start)
	prnt("elapsed: ", elapsed)

	// Concurrent
	prnt("\n Concurrent: \n")
	start = time.Now()
	prnt("start: ", start)

	runConcurrent(websites)

	end = time.Now()
	elapsed = end.Sub(start)
	prnt("elapsed: ", elapsed)
}
