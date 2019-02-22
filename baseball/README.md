# Baseball Data Analysis
It seemed to my brother and I, that when high-priced free-agent Mo Vaughn played for the Angels in 2000, he was striking out in clutch situations; with the team behind,  men on base and a home run desperately needed. We felt that Mo only hit home runs when the Angels were either so far ahead the game was in the bag, or when the Angels were behind and losing was a foregone conclusion.

Using "R" to write a simple script against the Sean Lahman baseball database, combined with Retrosheet game data, I was able to determine my suspicions were unfounded.

View the "R" script [clutchHRs.R](/baseball/clutchHRs.R)

The data shows 67% percent of Mo Vaughn's 36 home runs that year were hit when his team was behind.
So I compared his performance with that of his peers Mark McGwire and Sammy Sosa. Results appear below.

**HR** = Total home runs for the year<br />
**CHR** = Clutch Home Runs (home runs when the batter's team is behind)<br />
**IR** = Irrelevant home runs (the game is already decided and the pressure is off)<br />
**CHRP** = Percentage of home runs which are clutch home runs

Mo Vaughn
<table>
<tr><td>CHR</td><td>HR</td><td>IHR</td><td>CHRP</td></tr>
<tr><td>24</td><td>36</td><td>12</td><td>66.7%</td></tr>
</table>
<br />
Mark McGwire
<table>
<tr><td>CHR</td><td>HR</td><td>IHR</td><td>CHRP</td></tr>
<tr><td>24</td><td>32</td><td>8</td><td>75%</td></tr>
</table>
<br />
Sammy Sosa
<table>
<tr><td>CHR</td><td>HR</td><td>IHR</td><td>CHRP</td></tr>
<tr><td>31</td><td>50</td><td>19</td><td>62%</td></tr>
</table>
