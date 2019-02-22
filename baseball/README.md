# Baseball Data Analysis
It seemed to my brother and I, that when Mo Vaughn played for the Angels, he was striking out in clutch situations, with the team behind,  men on base and a home run was desperately needed. It seemed to us that Mo only hit home runs when the Angels were so far ahead the game was in the bag, or when the Angels were far behind and losing was a foregone conclusion.

Using "R" to write a simple script against the Sean Lahman baseball database, combined with Retrosheet game data, I was able to determine my suspicions were unfounded.

The data shows 67% percent of Mo Vaughn's 36 home runs that year were hit when his team was behind.
So I compared his performance with that of his peers Mark McGwire and Sammy Sosa. Results appear below.

HR = total home runs for the year<br />
CHR = Clutch Home Runs (home runs when the batter's team is behind)<br />
IR = Irrelevant home runs (the game is already decided and the pressure is off)<br />
CHRP = percentage of home runs which are clutch home runs<br />

Mo Vaughn<br />
CHR HR IHR CHRP<br />
&nbsp;24 36 &nbsp;12 66.7%

Mark McGwire<br />
CHR HR IHR CHRP<br />
&nbsp;24 32 &nbsp;&nbsp;8 75%

Sammy Sosa<br />
CHR HR IHR CHRP<br />
&nbsp;31 50 &nbsp;19 62%
