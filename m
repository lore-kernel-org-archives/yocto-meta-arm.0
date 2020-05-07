Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.78])
 by mx.groups.io with SMTP id smtpd.web11.2919.1588845680922009907
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 May 2020 03:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6kaMVKs/;
 spf=pass (domain: arm.com, ip: 40.107.7.78, mailfrom: vineeth.raveendran@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZDMqVcNjS95ILA1JCi85k60wdqim+HifuHwwJU6tjg=;
 b=6kaMVKs/8Dfn/tWI3VTMktfqKkyyA9ATy6Ha+88ES2rW7053NziHmHFMn3gnau9fDm9fzF+DcBjoiUjsQjRLsOrcdDQM5Ar0nJncNl3/c3hUlujne5X2YYz/qS7ds+8WryHa2uB7XFwKTHXHB/5JHETzl3BtzMWwigi0NqnlG/E=
Received: from AM7PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:20b:110::21)
 by DB8PR08MB5209.eurprd08.prod.outlook.com (2603:10a6:10:e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Thu, 7 May
 2020 10:01:17 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::35) by AM7PR04CA0011.outlook.office365.com
 (2603:10a6:20b:110::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Thu, 7 May 2020 10:01:17 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 10:01:16 +0000
Received: ("Tessian outbound 567b75aed2b9:v54"); Thu, 07 May 2020 10:01:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e4dadaf885c47ca5
X-CR-MTA-TID: 64aa7808
Received: from 68081a594b7c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 532B9644-7852-4AE7-8C3E-976A1CB9C839.1;
	Thu, 07 May 2020 10:01:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 68081a594b7c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 May 2020 10:01:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlHMhlcZ4uAHa1mxAh3QhZj+Q1kpNM4lkwiewvTTKCPmuJeprrt+Ui9W9GFenOQFGHZKBqXsHb8iBgMEdzQZsjwCTEosPaGGgdTGZ7/9PN8hVx8K2Qbau2B6nZ14SXy6O3wN9+HW2rLfV2JIuYhut29xn0HrKPFBE4e2mrXCzM7uAT+Mq4Mg1BhkQxyjFkmMhBAE0Y2uea6M1rBY+Z+AZ/69ZTuFvHK8aBWqnph+Bonr3bZ2AUO1bYPcmNit/lkq9GG+S99zeKc/L6to9NW5Xbe5iSF3BD3vB6IX0OrbG5p+sOljYG03Nx1NOKAemjnRfhrUCE+S6yjhy+FxOTeg4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZDMqVcNjS95ILA1JCi85k60wdqim+HifuHwwJU6tjg=;
 b=PNBOJasWWGDLnbjZxbOpj0AlPHPex6LIrs2jynzTO8KwHahaks4HfpXmX/npsnpKISA3ooTF45yFJ82G8LkrD/S0CQ55b5P0F3minfunFUuRIQdB6E3gUUL7kwatRuMjnPsqovsHhtXIXRQhSayMIgNaUHkuXtcVKeMG90atAAHPy+voTmQoNuo+R/KT4pCaCm6A9Yjm9VwYyS+KcsjarTJtr424aiDd6ovYTwTlp+QkhUgktZxpPJ2pZShUx6SUvKFlgL7N6tiiWUmC1FYoN4KETxUVO0k9YVB2UsP6dg8UBfkb1z4saNGefoJM4k8RrI9dCZhRzgEuKnwn+V6+KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZDMqVcNjS95ILA1JCi85k60wdqim+HifuHwwJU6tjg=;
 b=6kaMVKs/8Dfn/tWI3VTMktfqKkyyA9ATy6Ha+88ES2rW7053NziHmHFMn3gnau9fDm9fzF+DcBjoiUjsQjRLsOrcdDQM5Ar0nJncNl3/c3hUlujne5X2YYz/qS7ds+8WryHa2uB7XFwKTHXHB/5JHETzl3BtzMWwigi0NqnlG/E=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (2603:10a6:803:bf::19)
 by VI1PR08MB5343.eurprd08.prod.outlook.com (2603:10a6:803:12d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Thu, 7 May
 2020 10:01:09 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::e106:3936:4db6:627c]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::e106:3936:4db6:627c%3]) with mapi id 15.20.2958.034; Thu, 7 May 2020
 10:01:09 +0000
From: "Vineeth Raveendran" <vineeth.raveendran@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 0/2] Dunfell compatibility patches
Date: Thu,  7 May 2020 11:00:52 +0100
Message-Id: <20200507100054.25199-1-vineeth.raveendran@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN4PR0501CA0077.namprd05.prod.outlook.com
 (2603:10b6:803:22::15) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:bf::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123640.arm.com (217.140.99.251) by SN4PR0501CA0077.namprd05.prod.outlook.com (2603:10b6:803:22::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.11 via Frontend Transport; Thu, 7 May 2020 10:01:07 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3ccc4195-c06d-4056-e7f5-08d7f26d9551
X-MS-TrafficTypeDiagnostic: VI1PR08MB5343:|DB8PR08MB5209:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB5209C3DECD1714393C43B4AC9AA50@DB8PR08MB5209.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Bb7qJ0iBSKDWYoLuPpSLqHz6ypK3ydQIji5WE/Zid0iLzDu9qNhq70tW065qZJVyzal2sDtB0rG9UF9ryjd+hu4tDA9u7RQDqtuN6Fkqu8WDq/qwUC5orAFWkNwAeSrnHVz8Vy36pp8tsfXdpmlYahB+JNpYDyArqQiz7BYBCJemTAirMCk6RPr7OkCTShbyWCJ+GTP9IfC0t3RGkujBd6VSz9edzkacltgC8vVkIPF4fUzRmJ076d702KNI8/hIr4X9WRCEziyaJjFLuPlKNp7ciHVLBu5U3Lb/H28QvRSJXETw2v8pdmDWI7xCEcqYnXud4iyXZgg86/WMIBLxzbZVu5WoAX3NwLvvf4znSZuuQ6DCptqJkBCMEcahLAmny2H7KCEKtxcKZzacAq9J5ugFX4kLvWO+hy3s53guVLMr6Dz3eZCMtj65YV4QYvX97xZ0m6IIxBclisJ+XXrMSJ10Ulu5c9cylPTyf+eGI6bQK4wy56hGfSkowEMPE8Tv2MQD5BPBlEBUvQteYi4aNg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(33430700001)(316002)(33440700001)(52116002)(6666004)(6916009)(36756003)(83310400001)(83300400001)(4326008)(6486002)(5660300002)(83280400001)(83320400001)(83290400001)(1076003)(66946007)(66476007)(66556008)(478600001)(956004)(2616005)(44832011)(16526019)(8936002)(186003)(7696005)(86362001)(26005)(8676002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 hIaPfbBQcfPTf7j9OGt5VPihcjxGQeBhToe5E3nkbvpnvs/WJwrPc8L1tKZfo6OjUDeB+pXlr8ny35z4pSe5t2MxropCMvtVykPeWPnwexZ/o1f9lBa0ob2FZjO8JRSH2pKArBWRqUEORaSWpk8AHVRaPxtKFzlHfHGsqM6G1S9MoblptbsqfBU6SZojhdFmG8qVPrFowJfAWxrXT41AbpT3iHBiGo7GxovNY6Nhkby7IWzLkRz5OKF3okKiZgf9Tg8/B1TjPqBOrqP+H5hu70V/EOkNSEYQ1CcswHr8Dnxma5i8Z8y5JBjNBCHJrIvWc1G4gms8pxR9HeKs/EnSblSPGUtodBj0+vLdlfUjQi0JEKX2CdOx0wdrwkLPQQb52lq9IhPEI4qsoopWWa/GASKfLPKSojWZDVNr7hkiwJNdC6d8bI3e2EBdc97VkSrzC9MIwupnKI1F8LmAGqfhSqFsNNHT21oo/fsbS0SKFKOmKDaJdV0Gk5mUqfVGV0O9IJ4a9QhhFZo9YthU1WSyJ7xO1e2dNTWX6H0cLmzTLQMUW05tqiLri2bVq8WIsR/dYfNDexxxszfJNne+gQIqm3bVcdTLRp0ddnD6+27Yr9m4IDrQMi55ruJH28LKOikOxPtcp9cDRK7J4K6FSGexoj3Z3ZdaTHZcLcDNFmO3N3K5o3V0gROfXhLyI3iyatqDSyf+jIZHmDqS2OXRV2wNj0cE1R/FJZQcR+lvNo492bxTT70oWGs8Y8PzOhQxVWeB72RxW5LgEpZBzMxapDigGBHFb3Wjm5AEJ9t1ljdoMKA=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5343
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Vineeth.Raveendran@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966005)(33430700001)(44832011)(1076003)(336012)(6666004)(7696005)(81166007)(82740400003)(47076004)(33440700001)(2906002)(356005)(82310400002)(6486002)(316002)(70586007)(4326008)(8676002)(70206006)(5660300002)(478600001)(8936002)(86362001)(2616005)(6916009)(36756003)(26005)(16526019)(36906005)(186003)(956004);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d98777c4-a17e-4008-d1fd-08d7f26d90c4
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WxwgY+5VCvi17AG/V2jmUFy3I3BUH0DZcPwP7AZ0NUe2207Igu7bQfIVedpT9eo8um89NfVtTBNbIFgrTeupxUuO7EFJRZCIfwCNCOLjB91U7Xab3jyT0OpYNebePhmHDFnwrJOmSU49Lvjg2hqC9rJSRRFenYkPLDvujYRTOJGBRRo/s+QB7Z5+CpFwPoNEFZUuPc7swsLtTKGS/fuQYkBayVoJqqk6B11jLRhAmnAStLCBAULnc1/EhwXDoZFWagcwSeJAEAYW069ORX+kcMjWKhyyA5hhcc3tVzXT2BO++rocU1Vt/lkWOV30pnJbc+sD5hgzW1FiJeDkyQe7WB+zIPFWzN9X7FiIqKvDdzpR75/SJzKx0SAOFOPVFVPrcLMzWryofmkfRZMjItyuJS0BAZoyoLqE92xtHs0LDY4IGusILC2bnyOmSTEZchoD4Eh4S+VkU7J1IcgxTbjYbLyK1LRr9BFM0JIPc6ORBGtXHrDiBXe0wD8YNgWf9Cg5wsnkNg2bcQPIJy2OT2PjNf2+LH0rWD4JH2wbjz61WkANKe83vGV3eReoFmet+1+zsiWvKNgJz6oB/qfJ+ZF5iw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 10:01:16.6194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ccc4195-c06d-4056-e7f5-08d7f26d9551
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5209
Content-Type: text/plain

The following two patches add dunfell compatibility to foundation-armv8,
fvp-base, juno, and gem5 in meta-arm-bsp and meta-arm-autonomy.

Please note that though gem5 now builds with kernel 5.4 (Dunfell default),
it's not compiling due to python2 dependency.

Vineeth Raveendran (2):
  [arm-bsp] add dunfell support for fvps, juno and gem5
  [arm-autonomy] Move to dunfell

 meta-arm-autonomy/conf/layer.conf             |  2 +-
 .../conf/machine/arm64-autonomy-guest.conf    |  2 +-
 .../images/arm-autonomy-host-image-minimal.bb |  4 +-
 .../0001-trace-fix-build-with-gcc9.patch      | 56 -------------------
 ...e-number-of-interrupt-lines-for-dom0.patch |  0
 .../xen/{xen_4.%.bbappend => xen_%.bbappend}  |  4 ++
 .../recipes-extended/xen/xen_4.12.0.bbappend  | 10 ----
 .../xenguest/xenguest-manager.bb              |  2 +-
 meta-arm-bsp/conf/machine/fvp-common/fvp.inc  |  4 +-
 meta-arm-bsp/conf/machine/gem5-arm64.conf     |  2 +-
 .../fvp-common/u-boot_vexpress_fvp.patch      | 13 +++++
 .../recipes-bsp/u-boot/u-boot_2019.%.bbappend |  9 ---
 .../recipes-bsp/u-boot/u-boot_2020.%.bbappend | 13 +++++
 ...4.19.bbappend => linux-yocto_5.4.bbappend} |  0
 14 files changed, 39 insertions(+), 82 deletions(-)
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/files/4.12.0/0001-trace-fix-build-with-gcc9.patch
 rename meta-arm-autonomy/recipes-extended/xen/files/{4.12.0 => 4.12}/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch (100%)
 rename meta-arm-autonomy/recipes-extended/xen/{xen_4.%.bbappend => xen_%.bbappend} (83%)
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen_4.12.0.bbappend
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_fvp.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2019.%.bbappend
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto_4.19.bbappend => linux-yocto_5.4.bbappend} (100%)

-- 
2.17.1

