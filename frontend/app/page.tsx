'use client';

import ConnectWallet from '../components/ConnectWallet';
import StrategyForm from '../components/StrategyForm';

export default function Home() {
  return (
    <main className="min-h-screen bg-zinc-950 text-white">
      <div className="max-w-5xl mx-auto px-6 py-12">
        <h1 className="text-6xl font-bold mb-4">YieldAgent</h1>
        <p className="text-2xl text-zinc-400 mb-10">
          AI Agents that automatically optimize your yield on Base
        </p>

        <ConnectWallet />

        <div className="mt-16">
          <StrategyForm />
        </div>
      </div>
    </main>
  );
}
