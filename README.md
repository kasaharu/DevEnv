# DevEnv

Vagrant で用意した Ubuntu 14.04 上に開発環境を構築する


## インストールできる主な機能
* vim
* git
* ruby (rbenv を使用してインストール)
* rails
* docker

## Vagrant を使用して仮想環境を構築するにあたりホスト OS 側に必要ソフトウェア
* VirtualBox
* Vagrant
* Chef
* knife-solo
* test-kitchen
* Serverspec

## プロビジョニングテストツール
* test-kitchen および Serverspec を導入
* devenv/ 下で `$ kitchen test` コマンドを入力すると  
  仮想環境立ち上げ、プロビジョニング、テストまでをひと通り実行する

