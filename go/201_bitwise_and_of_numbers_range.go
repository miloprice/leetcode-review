func rangeBitwiseAnd(m int, n int) int {
	power_of_2 := 1
	for power_of_2 <= m {
		power_of_2 *= 2
	}
	if power_of_2 < n {
		return 0
	}

	result := m
	for i := m; i <= n; i++ {
		result &= i
	}
	return result
}
