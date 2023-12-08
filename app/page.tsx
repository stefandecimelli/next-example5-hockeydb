import { getAllPlayerStat } from './lib/data'
import styles from './page.module.css'

export default async function Home() {
  const allStats = await getAllPlayerStat();

  return (
    <main>
      <h1>Hockey Stats</h1>
      <table className={styles.playerTable}>
        <tbody>
          <tr>
            <th>Team</th>
            <th>Player</th>
            <th>Goals</th>
            <th>Assists</th>
            <th>Points</th>
          </tr>
          {
            allStats.map((player) => {
              return (
                <tr key={player.id}>
                  <td>{player.team}</td>
                  <td>{player.player} {player.number}</td>
                  <td><strong>{player.goals}</strong></td>
                  <td><strong>{player.assists}</strong></td>
                  <td><strong>{player.points}</strong></td>
                </tr>
              );
            })
          }
        </tbody>
      </table>
    </main>
  )
}
