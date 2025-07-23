import { useState } from "react";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";

export default function LPCalculator() {
  const [entryPrice, setEntryPrice] = useState(45);
  const [currentPrice, setCurrentPrice] = useState(43.7);
  const [capitalProvided, setCapitalProvided] = useState(15500);
  const [feesCollected, setFeesCollected] = useState(781);
  const [lpValueNow, setLpValueNow] = useState(14250);

  const hodlValue =
    capitalProvided * ((currentPrice + entryPrice) / (2 * entryPrice));
  const ilPercent = ((lpValueNow / hodlValue) - 1) * 100;
  const netPnL = lpValueNow + feesCollected - hodlValue;
  const netPnLPercent = (netPnL / capitalProvided) * 100;
  const status = netPnL >= 0 ? "✅ PROFIT" : "❌ LOSS";

  return (
    <div className="p-6 max-w-2xl mx-auto space-y-6">
      <h1 className="text-2xl font-bold">LP Farming Calculator</h1>
      <Card>
        <CardContent className="space-y-4 pt-6">
          <div className="grid grid-cols-2 gap-4">
            <div>
              <Label>HYPE Entry Price</Label>
              <Input
                type="number"
                value={entryPrice}
                onChange={(e) => setEntryPrice(parseFloat(e.target.value))}
              />
            </div>
            <div>
              <Label>Current HYPE Price</Label>
              <Input
                type="number"
                value={currentPrice}
                onChange={(e) => setCurrentPrice(parseFloat(e.target.value))}
              />
            </div>
            <div>
              <Label>Capital Provided (USD)</Label>
              <Input
                type="number"
                value={capitalProvided}
                onChange={(e) => setCapitalProvided(parseFloat(e.target.value))}
              />
            </div>
            <div>
              <Label>Fees Collected (USD)</Label>
              <Input
                type="number"
                value={feesCollected}
                onChange={(e) => setFeesCollected(parseFloat(e.target.value))}
              />
            </div>
            <div>
              <Label>Current LP Value (USD)</Label>
              <Input
                type="number"
                value={lpValueNow}
                onChange={(e) => setLpValueNow(parseFloat(e.target.value))}
              />
            </div>
          </div>

          <div className="pt-4 space-y-2 border-t">
            <p><strong>Value If Held (HODL):</strong> ${hodlValue.toFixed(2)}</p>
            <p><strong>Impermanent Loss:</strong> {ilPercent.toFixed(2)}%</p>
            <p><strong>Net PnL:</strong> ${netPnL.toFixed(2)} ({netPnLPercent.toFixed(2)}%)</p>
            <p><strong>Status:</strong> {status}</p>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
