#graphing the accident rates in 2024 vs 2025

import matplotlib.pyplot as plt

months = []
pre_rates = []
post_rates = []


with open('rates.txt', 'r') as f:
    for line in f:
        if line.strip():
            parts = line.strip().split('|')
            months.append(int(parts[0])) #month
                
            val_pre = float(parts[1]) #pre toll accident rate
            val_post = float(parts[2]) #post toll accident rate
                
            pre_rates.append(val_pre)
            post_rates.append(val_post)

plt.figure(figsize=(10, 6))
    
plt.plot(months, pre_rates, marker='o', linewidth=2, label='2024 (Pre-Toll)', color='blue')
plt.plot(months, post_rates, marker='s', linewidth=2, label='2025 (Post-Toll)', color='red')

plt.title('Monthly Accident Rates: 2024 vs 2025', fontsize=14, fontweight='bold')
plt.xlabel('Month', fontsize=12)
plt.ylabel('Accidents per 100,000 Vehicle Entries', fontsize=12)
plt.xticks(range(1, 11)) # Only months 1-10 bc uploaded mid november
plt.grid(True, linestyle='--', alpha=0.6)
plt.legend(fontsize=11)

plt.savefig('ratesGraph.pdf', dpi=300)

