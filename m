Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C02EE57D7
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 20:57:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.41])
 by mx.groups.io with SMTP id smtpd.web11.32516.1726088261594364123
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Sep 2024 13:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lQKhFcpn;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lQKhFcpn;
 spf=pass (domain: arm.com, ip: 40.107.22.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nypflzf8/GpziFMmM3bcPLXixUduOB3zb4K/jFVNb/8BKnToy9A5ihBlHsQ83vR5Y64UriwAMvLUahFRf7HVtCCy9li2m0wKeGRBEZDQ6xDAgH1yNFbZukGw93JCZ+1IKZXLTewqA5Uz0u45Owiv6WOoTwal1CRPqwKBThDAujKq0/SbALHVJ/u5Bnp84OGdEEQ5fqlJzyxxpydCI5oRWBYm9vEHwd6Ix0hzkgeM5HbYyvg0xrc9Gqw19DSQkuSzFqWTCi4REZocu4ehdjt1G5mZ9tK9vjGuJl3SFbKrjkZjwNLnVctoaGZa7bXnEkGM7nfp6bR1dCxF6EdGP3dMjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGzrrKaa4VvWSFRE41xEzmjm8pCJQeBLDQYmfaKsZQc=;
 b=BbDCT02JEIytIiikssivEkVkFiTGjA2W8npA20/VOCryeAvfB8ef/4vVw7lu4A0GfgMWlSAaGEkiKn/oDTpTt1ycFLnAFIbv0l/q9buVDezk+QjYdfcnXI7qkOxkJxuWBzM+60/klVJIut+AcWwAqUsF6NOSNkmj8Vm444fFa2J8PLwJoE0vouazA24Xo+KbmJ7xioYuDYzJCxNRHYLRWOwn8PytlNV/8B06zG62SUTkzzbaJ49omStlanXOx3Uaj621tYKcWN19lopP/hN8k7+jL8ODCLlBQDphh8OBOgjTzB6Yibcr+ndwPImweo88/6XfFPdgnKOH/y5jvbPjJA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGzrrKaa4VvWSFRE41xEzmjm8pCJQeBLDQYmfaKsZQc=;
 b=lQKhFcpnumKlDasd0MvAhE+/9rbrUfXAQlO0P+AoSIjKVvmo7gkThDrDrkULv0kG6yHwbNLA4GNqAaFKAoZokkRloWEpIKg8i/8Z6PcBle4b9KwVe6v6J9oGPZQHEDpqZMlRZz4dI0AfC3jjymxcD54/TjbFQ0PNCqlJEbeVxB0=
Received: from DU7P195CA0003.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::19)
 by VI1PR08MB10123.eurprd08.prod.outlook.com (2603:10a6:800:1c7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 20:57:35 +0000
Received: from DU2PEPF00028CFD.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::d7) by DU7P195CA0003.outlook.office365.com
 (2603:10a6:10:54d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Wed, 11 Sep 2024 20:57:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028CFD.mail.protection.outlook.com (10.167.242.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Wed, 11 Sep 2024 20:57:32 +0000
Received: ("Tessian outbound ee7a81b3b7b9:v441"); Wed, 11 Sep 2024 20:57:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 33c8ef02d3d2b34f
X-CR-MTA-TID: 64aa7808
Received: from L310c2b531fef.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5DE12CB4-731C-4302-BF92-D23D621CF6A8.1;
	Wed, 11 Sep 2024 20:56:46 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L310c2b531fef.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 11 Sep 2024 20:56:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICpXNHLsgPlftehIBiJxm8rYB+BZHOi50ekP38uZAx6iOUHpKn1pv9617jHkBL+4JjLJ0eI8hfO6eg8bRKE+79H7TEi/zcuY52MEbDb7m2ZPl9vqsse8csWoqduahpwfAsdorB97FF3Bjrx+wZO+2qqv7/v2EewR8jPWxVAWbMucGAb8EzQ42FG6fm6f7TXuKfWprLIf1As1B23BDy6r4WpnWtlfeDwRepTIiEss8UYynM/MBgPUzinJi9jKzcvxsez+b6FTFZlrHMHHHKuCgJNE4ciw6iIKHfS+MPH0xBUo/yc/BhzV0x1BaYBHzRh4WKB/B7BkeEle1v8ACggYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGzrrKaa4VvWSFRE41xEzmjm8pCJQeBLDQYmfaKsZQc=;
 b=iSj9eZBZuUl93RN4ftqHnAr6aSJwL+NikbvTBuQayQ6VkyHZ9x/bhygVxdiKg7WjUp/Kpszoxm4KPXd58uE8fVhBftp4eR6hc+vf8Z0fgIWGhZkd83wNS64Ju2X8G8r9+LWCofCYtGERJtxhRDyhMgoSXddvxRie8vTQhyXgm9m8MDYa74I90lB2pAfm1WVLxBb1P1vSb8MNpgLRf+M1a9LbWm+xKUU0tTiSnvY9q4WS60vQErD1iYukEarzcjEnqOOH1Ekzq3KKxB2HPRlN2uf80bdGN1/yRKF2uxZv757vosbbGBslaGldkDPa0rdHVvOwav66TyjueqYSlF6+KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGzrrKaa4VvWSFRE41xEzmjm8pCJQeBLDQYmfaKsZQc=;
 b=lQKhFcpnumKlDasd0MvAhE+/9rbrUfXAQlO0P+AoSIjKVvmo7gkThDrDrkULv0kG6yHwbNLA4GNqAaFKAoZokkRloWEpIKg8i/8Z6PcBle4b9KwVe6v6J9oGPZQHEDpqZMlRZz4dI0AfC3jjymxcD54/TjbFQ0PNCqlJEbeVxB0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB10326.eurprd08.prod.outlook.com (2603:10a6:10:472::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.13; Wed, 11 Sep
 2024 20:56:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.7962.014; Wed, 11 Sep 2024
 20:56:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hv7005920@gmail.com" <hv7005920@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] qt meta-toolchain for rzg2l #toolchain
Thread-Topic: [meta-arm] qt meta-toolchain for rzg2l #toolchain
Thread-Index: AQHa/5YRGPpELPEqBUKonnQzccpAvrJTGvuA
Date: Wed, 11 Sep 2024 20:56:42 +0000
Message-ID: <499935A7-747A-4238-9083-AAB23C7BDCCA@arm.com>
References: <U7jb.1725542247813080822.I1o5@lists.yoctoproject.org>
In-Reply-To: <U7jb.1725542247813080822.I1o5@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB10326:EE_|DU2PEPF00028CFD:EE_|VI1PR08MB10123:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ed692d-9339-427e-562c-08dcd2a45b46
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?nKQaTb16fMxb7mN4B3smYsfxTBYcLgDpob8Aiatnhpdfpq8NJyjV6vp9MnkF?=
 =?us-ascii?Q?2NXM6c5ymu5bvigI6Zwyh0G0QWQEdQ1ddBEX3CVoy+pstPstVEMFxzhgM4EF?=
 =?us-ascii?Q?AilqZdyiXMMDxxNRT234ZkMHE+QPD9+1E5ueAOMOFeGqpybWJByjutrW6DnI?=
 =?us-ascii?Q?frM4qaaaXKW1EyAn1g14svDnijSIfXQIoAjki12uBuJ4icJr/KLH6QxXH2kY?=
 =?us-ascii?Q?dAWpbafCG+funHT2QsR5LREy82YPT5U6iHkvLGNiXy5o7G7/460S6QhMWtB4?=
 =?us-ascii?Q?cjt3pqtg9mw1hF2dwDEyp7m9fLLmMpsnlm5CONMK/eKWUEskzlLhZ+Oxgtno?=
 =?us-ascii?Q?DZXfMjP6Jor1f9bGKDM8DDQt9qEq6YtuzqXF/pxrX1c7IWhagefHQhpbgSoP?=
 =?us-ascii?Q?PacS0I4Fh2Dr8VObPXoETCfn+6tp9/1J/QX3OQAHf8PN+tnOdV0lqlztC+Gi?=
 =?us-ascii?Q?5BPhkozzMGT6rljbhTP0VDocjgrNfdllF3BRzJIINtdP+TwqIe7kOElHuM8e?=
 =?us-ascii?Q?fUFLADIVsTiVsygrGirZt4+wwDkXeKiMHoC2EvzqztZ6p0zRAJkFt1OER4PD?=
 =?us-ascii?Q?Wp89DHFnYkEEm/QnL96LDEvnDPTfeVATsPbgnctUfTR3lOCN4ELod9QcBfJz?=
 =?us-ascii?Q?Rmn/ar4yqZnX+rOGjr6QYYX1z7cqS2mSIBbMPMwr2hCvELKCvnYIWzuogpOY?=
 =?us-ascii?Q?UAVOSxmwikWUNaleRFbOecC7GYeHFT3+kXhZLyhqa5AM+4r+FF7CQm284bU2?=
 =?us-ascii?Q?rZ2rFWW6zhD95qIvbg1T14LbZhiAJx0WkR2lj6fUcrPl10oyIRgdLtCZB2ty?=
 =?us-ascii?Q?05G89AKfTl3Hv5R/qpzTcTwGnVSrAac+lmYxoJG4tCQ/kUJrokB8aYW888hO?=
 =?us-ascii?Q?Iwe3v/2ysYiQuPFqKfX7yq1XXvCuX/VhRCpqqofwIEU4OKCShVuuPOBOGFXc?=
 =?us-ascii?Q?Ad9rIwQwPJBoIHKlNKb7/f01eDEVmYrq2gjt8BstvyWEb3zcIou8ympplyM8?=
 =?us-ascii?Q?e1BXJeQtNctCKr88wBUMDseL8dEpUKRTx1d3qnqk1leOpAoerv/bkjVuGrJL?=
 =?us-ascii?Q?/w/h3ash7IVpEsv3TfHks5TbSdYxmz49y3pMCH4CvVlTh7mjcYfQ3yk7LHNM?=
 =?us-ascii?Q?vpn0Ovortngm7lglMBBITCjRCFrrVfEg50DJvNjlEviu55Slli0qoj05UtqN?=
 =?us-ascii?Q?6Z4lPCUjrQK+YZ4c4rujV8KdhPspHnMRe8aLn2EoqTCPD1DEfTeR7c28+vNO?=
 =?us-ascii?Q?6nrfPQeqign5bJ2n3p2Oat6kxnfVit3CWF+BtHLAISUTvple2bBzph0ZJADV?=
 =?us-ascii?Q?6xiMKLc3REIhvpBWgPd+pycl5PlMQCLGFf4WpyEJjhZna8ymYFqZub3EeC68?=
 =?us-ascii?Q?eVbrmMvNFPq3+r7zQFNKOIssZRcuyKKU7hqSxdyyZuvuLek0FQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7283F4AA5BE27F44AAA6BF1FFEA3D545@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10326
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	78afa1b1-33f1-48c2-1186-08dcd2a43d3d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|35042699022|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OzaWJyTCYu2xM504mJjNM/pU3BYTWPygsD1evgmKG6uDg/1VjuZhvS3F1XQ1?=
 =?us-ascii?Q?j+DIu9ZpAr27ExKZa1H2XorY7z2lIy+vgzQY3dtzpSr/knvwzvcVaVgRjjMA?=
 =?us-ascii?Q?xkbpxEsJ5dP5UT/U2e55QJF/HGnhMM7nnWQFkRnMo6eHWnvI5qdlwvjlx8Ta?=
 =?us-ascii?Q?Wwp/chS4YdWGSWlNY8q/OyMJR/J3TbI0JoA6KcypUyCLu/e2P7ZcNLDOfiOq?=
 =?us-ascii?Q?0PXwNlCqrycWhC9NgDVNEeX7rusiVkRRhBGYUaLaEyG5mqpimvSEDbcYFu+D?=
 =?us-ascii?Q?ldNZHabS44NBI91EWlppH37W9atKa8qymvjHsG/LjkPdhCFjwXVGp+CmbBB7?=
 =?us-ascii?Q?cyN1GEW4pqDM5mPmzteTdlGZzTTgvcmwxNLVLWQTQ1PTad2ZuisEOQZJMn7t?=
 =?us-ascii?Q?7pAwr1jc5DNHjWt+X2OhAHwKxQH7KUefDNNTqiC9XYa8EiB3xZ+m+AdKRsHB?=
 =?us-ascii?Q?BPXisqkPxCkuxi+uvsB+e+BaFmAjFgs870x0vn+33HqGbCmzxzEAsiTKetb6?=
 =?us-ascii?Q?Ictg1PJJvOet7s6hlU/gqO5TJDZY8Qzamm8TAIovmS+sIyiU4Y9MwJS59xKd?=
 =?us-ascii?Q?GNoxPcF5xGKXSfok9FlJxtGrfYrryNJcZRsKIcNLTxbHWjAktzJTkr44daEQ?=
 =?us-ascii?Q?SPEdKjMukmaTKPJAhQhDC7VUvm0MmO/o5LANQ/MDiBGkicUpyWDJMoaOgoil?=
 =?us-ascii?Q?6E//EQ0XTPNkDN31zsshHeTPe3lrjKVhT4kRNXtDpPG0k7VEar3Kn3jWRUqP?=
 =?us-ascii?Q?Xuga0JCwaY7v+vi/rA4d1HanxWdbhYFMGqskhwGf1TZ/O+PujtITHly+A+c2?=
 =?us-ascii?Q?ho1KbsPxavKY/ke9ERCYZINqZc0JpuMx6UKBgglyDO/CHdwOkoZe8tf4y4fO?=
 =?us-ascii?Q?bfZRhctB7j3dloFMF/4VDbdq36bgjmDcaRSSo7XzkS/bnJII6UickdbOS7yQ?=
 =?us-ascii?Q?Rw2XyGEfEIjAXHyRy49wEfPJjRw7ARj8PynHUqMIrTE7yEcwIoJtywRzdXrz?=
 =?us-ascii?Q?dA9ezXe0Bv9sh+gA4+UHTOa7/VGNjbkSXPn0Kj5TNINmyR1jAN26nDnjKwCU?=
 =?us-ascii?Q?A4+t+zXlGQYzfcvwLx+MCKRts1M5ghXI57i/N61YuYHpw+/nyGXBpZsCXZGk?=
 =?us-ascii?Q?iesw6vZTjdPRCrbYAoexIrpRbgT3cwdeQqSwCVfKOxA8MwlNvr8YYU3bS7Ss?=
 =?us-ascii?Q?I85MXGJbx4dAIpvdQ6YrtvxLWGY2LaZJiLAG47xGsiGTi1ViZMl9FQVN4KKE?=
 =?us-ascii?Q?ef6u6q9XX+eu/F4xNIHEB0w+sSJ0JYUwBVVFCtZ5VqfhcgKXyuzsbFlkBnYq?=
 =?us-ascii?Q?70TdkeQVFnOon8nwFigofcH5gN9Q4FV0VZ0TRpg5d0dshGmSlFLkBiSknGbQ?=
 =?us-ascii?Q?qzeyGyw6IL9gh7SrAitwAM86dg44sX/f6XgXh8Wm2wRdYYlKxphtcWwzOodk?=
 =?us-ascii?Q?xsziMhjd7LbBIGW36tCey1QzTK4BQHPW?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 20:57:32.7261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ed692d-9339-427e-562c-08dcd2a45b46
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10123
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Sep 2024 20:57:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6073

On 5 Sep 2024, at 14:17, hv7005920 via lists.yoctoproject.org <hv7005920=3D=
gmail.com@lists.yoctoproject.org> wrote:
>=20
> ERROR: qtdeclarative-5.6.3+gitAUTOINC+bb01612a88-r0 do_fetch: Fetcher fai=
lure: Unable to find revision bb01612a8809efd268903e41b9e3a17cff48f1c0 in b=
ranch 5.14 even from upstream

These are all errors in meta-qt5, speak to the maintainers of that layer.

Cheers,
Ross=

