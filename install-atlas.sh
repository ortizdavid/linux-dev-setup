#!/bin/bash
echo "📦 Instalando Atlas CLI..."
curl -sSf https://atlasgo.sh | sh
echo "✅ Atlas instalado com sucesso!"
atlas version
