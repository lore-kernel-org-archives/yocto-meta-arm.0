Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.62])
 by mx.groups.io with SMTP id smtpd.web10.8849.1585306372905650714
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ox9pgvIr;
 spf=pass (domain: arm.com, ip: 40.107.6.62, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vSrEr5jTEyJKjIl1OlbZi49cx+nKQ9aLGkQVr2O3Ag=;
 b=ox9pgvIriMe/e8oId7+WTmgNLVvn1IhfuuRXtWZiwYh0HPguqFqUbUEFxepZen0ajgMUlXEa26dHapHOQNC+kc5NfmGNpPfjCqb58p+zvw5v2wYRNsiM49Odf95Nff5MVP7apRpoaPw4KzevOHQjq1saXAElxayBtintoxnpMvQ=
Received: from DB8PR06CA0022.eurprd06.prod.outlook.com (2603:10a6:10:100::35)
 by VI1PR0802MB2624.eurprd08.prod.outlook.com (2603:10a6:800:ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Fri, 27 Mar
 2020 10:52:50 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::32) by DB8PR06CA0022.outlook.office365.com
 (2603:10a6:10:100::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Fri, 27 Mar 2020 10:52:50 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:52:50 +0000
Received: ("Tessian outbound 19f8d550f75c:v48"); Fri, 27 Mar 2020 10:52:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 93de1b615077ad99
X-CR-MTA-TID: 64aa7808
Received: from 870b71abb8fe.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CBEF61A8-D690-4E5E-B0BF-C357C61E6536.1;
	Fri, 27 Mar 2020 10:52:45 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 870b71abb8fe.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:52:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Op6fbvTF0fZaiTz52nBNr23MQ1Pc1MsE1f6NdRlOSw3Nrs8TMXnhQJODpSosL6ru7NbKrNb56x0fvvDXfdiHYpV79PDvgosdkK8aqwWj+jlSU5EwI6LG98HTDKDnWJwPtkBPrtyi5OBoIPAyL5YNQ32R9EzcJWQPdrFzQZxVZhb2ZzyjfkNQGsYhx8NylbZOgL3aXfbVlTf1wRly/tLelSWV7NT9JB3SJwdcoAscu4d1F8nWG6fu3IYoDWEnsDdZBgnu0u5zfudFkPPYbI9QppZrfBjgZwkxF48FbiL8K7/qINLlpVuaOgoEBKvG5t5s3UgsxDwuimH5XfL8F4tT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vSrEr5jTEyJKjIl1OlbZi49cx+nKQ9aLGkQVr2O3Ag=;
 b=MaXQkp3tSamdeSHQb8y18wx42puxprcoY3HU0inUMfJA0xSYRW+EH+4qA/TOxEEfn4Y9pNKaGNTMqjy4NNn1IZu+rcfVo6whIdbHgh8F0d7d9CZB1TT5KmjspmhTYb66FpZud20YV83A3Uf/lDQyb30fJfHsZKERL3PbSWI95cqgrMDbfRqUky63iVKZgR7MqXFY6V6FWkwWdeABxUY4SUnLWs+3JUwmcOZFKj7YDZUWJ6d/c9fNMRd/uYWEKC6TrMHC4XNXM5wFgYVGcr2BiMW+TQjRTTZ1mcJLqYAnDMCtMgZSU+IQ0nZSwCslpZixDe/hycbGMxbci7SfJ6GGoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vSrEr5jTEyJKjIl1OlbZi49cx+nKQ9aLGkQVr2O3Ag=;
 b=ox9pgvIriMe/e8oId7+WTmgNLVvn1IhfuuRXtWZiwYh0HPguqFqUbUEFxepZen0ajgMUlXEa26dHapHOQNC+kc5NfmGNpPfjCqb58p+zvw5v2wYRNsiM49Odf95Nff5MVP7apRpoaPw4KzevOHQjq1saXAElxayBtintoxnpMvQ=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3276.eurprd08.prod.outlook.com (52.135.128.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 10:52:43 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.025; Fri, 27 Mar 2020
 10:52:43 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 0/7] arm-autonomy: Introduce Xenguest system
Date: Fri, 27 Mar 2020 10:52:16 +0000
Message-Id: <20200327105223.460-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN4PR0201CA0004.namprd02.prod.outlook.com
 (2603:10b6:803:2b::14) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.54) by SN4PR0201CA0004.namprd02.prod.outlook.com (2603:10b6:803:2b::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend Transport; Fri, 27 Mar 2020 10:52:42 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 937df37a-b85a-4ff5-ecfa-08d7d23cfe93
X-MS-TrafficTypeDiagnostic: DB7PR08MB3276:|VI1PR0802MB2624:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB2624E094417C3C2127E49CD99DCC0@VI1PR0802MB2624.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(2616005)(44832011)(4326008)(956004)(52116002)(86362001)(8936002)(7696005)(8676002)(81166006)(478600001)(66476007)(81156014)(1076003)(316002)(6916009)(36756003)(6666004)(66946007)(66556008)(16526019)(6486002)(186003)(2906002)(26005)(5660300002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ZRQg8VCGTEojjv9ug7r3zTbxS5pdwBQWFrV0iLmSXVBVbr0SxEt37NEzS/xdrIaZH9M+D6cesDiH25hdAnMeJkO9rWekvBAcJmUh+zg/5boXJUTM6gH14oa7UC8UqflQUI4/RICgpJOF9ORvzP6WwOSBw7RucupkIaLdTF1NNr/e967ACC4mTTGxN9PNakOM4t+rj5ejszhofMy2S2kpgesh1r2IRt8nKyeiwAkBKUWsKvzAuxIoMwH9hq76k3UTbSlke9qviHHhf/EmSwNeZz5ctGvltrIYpZCsHxmS2qhkxMgD47UMyAmQam+/RAUz5R7mEzE9gFg7e1lDbPHmdzhXTbIaAUasaM8Sbu+F13Q4cY5mR2lOazSu/iy8CywEQFysj9yRADpKHYb2fSa6e0zIMfP17B3l41vA2hBHddlhxA8oNc8Gr41CwZXDpzm3dZTQT/8phrUSQbmVPBYdxdYPrRmHNYzpRK9m61PtR65MJirbfQqVkPmQOaJ4kp8aQRdcRv3xXoy8BNcvadZWced7dWaRYnUqG7/pHXBJap2w2aUGEHjmUjeUzhrMnSQqDpxHtDVbcD5YUD74Qzu7C4WeI8A9qF9WEFiBDzoPKWhT9ib1NQLo/evedA+UDa4J4O0SdTkqiplR+K4oNFyHEw==
X-MS-Exchange-AntiSpam-MessageData: 
 UyGk9o8zPqRd0NdSUu26wzDI2JtkA9k7P9eiCQMnckbNYVh5nXOogNmuV4ZnJUu8v3w2VlZD54srEuDpsiD3OX7mEC8+2B7h7sfPyRj8Ren527NNx/4fsD8XiDdU1z7SsWOfhJzloroyvVEI54AInQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3276
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(376002)(39860400002)(136003)(346002)(396003)(46966005)(6486002)(36756003)(8936002)(956004)(2616005)(70586007)(70206006)(316002)(6916009)(7696005)(82740400003)(478600001)(4326008)(1076003)(26826003)(44832011)(81166006)(8676002)(6666004)(47076004)(186003)(336012)(356004)(16526019)(2906002)(86362001)(5660300002)(26005)(81156014);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	17990939-2044-4ec4-ac89-08d7d23cfa36
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nF65HJozwAFbQfowzwWFNpgifLorZSVTRy5LJ66P3RFAguLM7afcA5Yb//5XdN/a0+ogFhf1gi07dl9R4Snkv4nsPGNYB8oyrMEiqP9WR3H0U+Dc/GIUsfTkHxzzIk6hXXC311ladKOUYNUpIAALlyPi/uOPM+w2KGWlHwHpgkJLCc32OUdm1uDn5q9VAgZ467Bv2Y6JlIve99YTHlsy79FiETVGqfwt0o9fv6Hak+WcK6hghX3SWgq3OCYKU072JqmFs67Dhu5MyXujUSY390sDIhWBvMnZpb96Xquakq4NuSYQQ193GPy01UN0cXooLn2bj13CMiYWZ8fCLYSmn4tEVueuitns7y+XRjhNkHWGSaPyvJxvbKRvjXJtFSLF+lrUxONDnQGeEkr7PlCGloKOu1PyIJq5w49M3+c0fCDnjPETLQh/pu0SqiSpDFzJRtiEEK5eYwLr5AjkAbk8UEXMZZWUcJz5etEDDAT12d6IucUAeOrlaKe4MY2puSAq5rSlPoTq/rKfY84xIdiSg7wg4sGGFpM+ElfbgrSMLBFjcpqSKWn8W+CDBMFavM/asIpuuKwWegOo7HDtnu3WX7gNNij3+/HOIPVjMbgmv3GZJJSz50Ayj5NsVaHB0oF2h8+vk/fy5wVD3+iP5+qMmL/D8TilKvWBjUPr4jHMIu3erWWxyABZYMYxU5Hf7hihJAIfh8Q2YaB63tMdJzFZFQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:52:50.7122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 937df37a-b85a-4ff5-ecfa-08d7d23cfe93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2624
Content-Type: text/plain

This patch serie is introducing the Xenguest system. It is introducing
an image format to store a complete xen Guest inside one image file.
The serie is adding Yocto recipes to create such images when building a
Yocto image.
It is also providing tools to use such images in a Xen Dom0.

Bertrand Marquis (7):
  arm-autonomy: Create xenguest-mkimage
  arm-autonomy: Create xenguest-manager
  arm-autonomy: Create xenguest-image class
  arm-autonomy: Create xenguest-base-image recipe
  arm-autonomy: Create xenguest image type
  arm-autonomy: Create xenguest-image-extra class
  arm-autonomy: Create xenguest-nodisk-image recipe

 meta-arm-autonomy/README.md                   |   7 +
 .../classes/image_types_xenguest.bbclass      | 132 +++
 .../classes/xenguest-image-extra.bbclass      | 102 +++
 .../classes/xenguest-image.bbclass            | 187 +++++
 .../distro/include/arm-autonomy-guest.inc     |   4 +
 .../documentation/xenguest-manager.md         |  67 ++
 .../documentation/xenguest-mkimage.md         | 119 +++
 .../images/arm-autonomy-host-image-minimal.bb |   1 +
 .../xenguest/files/xenguest-init              |  85 ++
 .../xenguest/files/xenguest-manager           | 640 +++++++++++++++
 .../xenguest/files/xenguest-mkimage           | 770 ++++++++++++++++++
 .../xenguest/xenguest-base-image.bb           | 116 +++
 .../xenguest/xenguest-manager.bb              |  52 ++
 .../xenguest/xenguest-manager.bbappend        |   6 +
 .../xenguest/xenguest-mkimage.bb              |  31 +
 .../xenguest/xenguest-nodisk-image.bb         |  38 +
 16 files changed, 2357 insertions(+)
 create mode 100644 meta-arm-autonomy/classes/image_types_xenguest.bbclass
 create mode 100644 meta-arm-autonomy/classes/xenguest-image-extra.bbclass
 create mode 100644 meta-arm-autonomy/classes/xenguest-image.bbclass
 create mode 100644 meta-arm-autonomy/documentation/xenguest-manager.md
 create mode 100644 meta-arm-autonomy/documentation/xenguest-mkimage.md
 create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
 create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
 create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bbappend
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-nodisk-image.bb

-- 
2.17.1

