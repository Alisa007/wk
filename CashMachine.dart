class CashMachine {
    List<int> bills;

    CashMachine(this.bills) {

    }

    List<int> exchange(int total) {
      int len = this.bills.length;
      int remaining = total;
      Map<int, List<int>> memo = {};

      for (int i = 1; i < len + 1; i++) {
          int bill = bills[i - 1];

          for (int currentAmount = bill; currentAmount < remaining + 1; currentAmount++) {
            List<int> currentEl = memo[currentAmount];

            if (currentEl == null && currentAmount == bill) {
                memo[currentAmount] = [bill];
            } else {
                List<int> potentialEl = memo[currentAmount - bill];
                bool hasCurrent = currentEl != null;

                if (hasCurrent || potentialEl != null) {
                  bool keepCurrent = hasCurrent && (potentialEl == null || (currentEl.length <= potentialEl.length));
                    memo[currentAmount] = keepCurrent ? currentEl : (new List.from(potentialEl)..addAll([bill]));
                }
            }
          }
      }
  
      return memo[total];
    }
}
