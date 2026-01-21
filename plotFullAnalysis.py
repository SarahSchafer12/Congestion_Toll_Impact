#plotting all data, per month, entries, collisions, accident rates, pre and post toll 

import matplotlib.pyplot as plt

def load_data(file_name):
    data = {}
    with open(file_name, 'r') as f:
        for line in f:
            if line.strip():
                m, val = line.strip().split('|')
                data[int(m)] = float(val)
    return data

def load_rates(file_name):
    pre_r = {}
    post_r = {}
    with open(file_name, 'r') as f:
        for line in f:
            if line.strip():
                parts = line.strip().split('|')
                m = int(parts[0])
                pre_r[m] = float(parts[1])
                post_r[m] = float(parts[2])
    return pre_r, post_r


pre_e = load_data('MTAavgs.txt') #pre toll entries
pre_c = load_data('preInAvgCollisions.txt') #pre toll collisions
post_e = load_data('postInAvgs.txt') #post toll entries
post_c = load_data('postInAvgCollisions.txt') #post toll collisions
pre_r_map, post_r_map  = load_rates('rates.txt') #pre and post rates
    
months = sorted([m for m in pre_e.keys() if m <= 10]) #sort everything per month    
pre_entries = [pre_e[m] for m in months]
post_entries = [post_e[m] for m in months]
pre_coll = [pre_c[m] for m in months]
post_coll = [post_c[m] for m in months]
pre_rates = [pre_r_map[m] for m in months]
post_rates = [post_r_map[m] for m in months]

# 3. Create the 3-panel Plot
fig, (ax1, ax2, ax3) = plt.subplots(3, 1, figsize=(10, 12), sharex=True)
plt.subplots_adjust(hspace=0.3)

# Panel 1: Entries (Volume)
ax1.plot(months, pre_entries, color='blue', linestyle='--', marker='o', label='Pre-Toll Entries')
ax1.plot(months, post_entries, color='red', linestyle='-', marker='s', label='Post-Toll Entries')
ax1.set_ylabel('Total Vehicle Entries')
ax1.set_title('Traffic Volume, Collisions, and Rates (Pre vs Post Toll)', fontweight='bold')
ax1.legend()
ax1.grid(True, alpha=0.3)

# Panel 2: Raw Collisions
ax2.plot(months, pre_coll, color='blue', linestyle='--', marker='o', label='Pre-Toll Collisions')
ax2.plot(months, post_coll, color='red', linestyle='-', marker='s', label='Post-Toll Collisions')
ax2.set_ylabel('Avg Monthly Collisions')
ax2.legend()
ax2.grid(True, alpha=0.3)

# Panel 3: Calculated Rates
ax3.plot(months, pre_rates, color='blue', linestyle='--', marker='o', label='Pre-Toll Rate')
ax3.plot(months, post_rates, color='red', linestyle='-', marker='s', label='Post-Toll Rate')
ax3.set_ylabel('Accidents per 100k Vehicles')
ax3.set_xlabel('Month Number')
ax3.set_xticks(months)
ax3.legend()
ax3.grid(True, alpha=0.3)

plt.savefig('fullAnalysis.pdf',dpi = 300,bbox_inches='tight')    

