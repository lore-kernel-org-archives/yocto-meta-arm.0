Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.89])
 by mx.groups.io with SMTP id smtpd.web12.8887.1585306468545414970
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=c19dMwZY;
 spf=pass (domain: arm.com, ip: 40.107.20.89, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UoEPCLshog61RCcgGNWyLVbgEQE46i2xI1QDLt9a2A=;
 b=c19dMwZYgV0b1EKu6lOolBJAeTv4pFyXRkv22xC3Qsx1bxPfXdxIz4jDQGIjtwV2eC/hPVPpWBq8lAmiVvi7J7z2G9t8iXDmEgM1zgwKXUQ25u0ysA3lCKwSCj9c1lKgU9q0TWOcvb9+cMolmzNGVA1UiZesifv3kReutON3nqM=
Received: from DB6PR0601CA0019.eurprd06.prod.outlook.com (2603:10a6:4:7b::29)
 by DB7PR08MB3275.eurprd08.prod.outlook.com (2603:10a6:5:24::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Fri, 27 Mar
 2020 10:54:26 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::d2) by DB6PR0601CA0019.outlook.office365.com
 (2603:10a6:4:7b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19 via Frontend
 Transport; Fri, 27 Mar 2020 10:54:26 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:54:26 +0000
Received: ("Tessian outbound 8f06d475fc37:v48"); Fri, 27 Mar 2020 10:54:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc6935f58df44724
X-CR-MTA-TID: 64aa7808
Received: from bc326ccef072.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 76DBAA24-D1F2-43E7-9F12-1A1B088E9EAB.1;
	Fri, 27 Mar 2020 10:54:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bc326ccef072.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:54:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQDvpClC6yXiCZPhgMI14MF1dP4nHubTYh5EVRoqus7ZXPVhW/pivqVNaNT+QXSl+aHlVRn0oySdX5s9JkjN3+oTuTAsUMI9OtKVcBMtA3I/E449M2kTyRlKUwGtOuibmW4oZDdVysGszKD61iFveqshaAAHherTUJFKiyIFvtz7o53wta3TsnAi2/TROLhA+UXuKfdtxhsIFP948xR/5UVq7XDDp5mAE4CA4prBWX/bmQrYyeKQR63xcjrfreY8Xh4o1Mb9YRBZSV5g+nm/qWctl/cko6hX/zx0Qddpgxr3uCCv2Jy90YCS129knhR+3Vf1uxG5NBKjtQ8bEzl0Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UoEPCLshog61RCcgGNWyLVbgEQE46i2xI1QDLt9a2A=;
 b=G8rCZnpnaQSmyjAdzmrrUbvMQ9qliq7htBojhhtMDiLyzhVjdge8uiau/s256hJiPfZ+yW9VhnzkRSstbPmQN7d6RUZGMqj1LAat1feFjhMMOmMvF3aRr5RzmJW4aPInQ2qC3ykp9xRrp3JV8RICUPJTTrsBxU+ZHu7lDWNJGXalYjCuIDkuH5mZ/+vAlGhLnqGYfFw5cCSIbvDvMti/pHQwKvYyc9nbx6LTWL8qS1dms+Z4FC1M1BJAFbnHhg/LYHoaswlukRBFwWSkADTn3vfBxaG7YEMm2Vrnbxe2t4G0bR/Bq8mz8btLxwIvt3uhQZcZODN8shFDY4rPblYneA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UoEPCLshog61RCcgGNWyLVbgEQE46i2xI1QDLt9a2A=;
 b=c19dMwZYgV0b1EKu6lOolBJAeTv4pFyXRkv22xC3Qsx1bxPfXdxIz4jDQGIjtwV2eC/hPVPpWBq8lAmiVvi7J7z2G9t8iXDmEgM1zgwKXUQ25u0ysA3lCKwSCj9c1lKgU9q0TWOcvb9+cMolmzNGVA1UiZesifv3kReutON3nqM=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3450.eurprd08.prod.outlook.com (20.176.238.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 10:54:19 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.025; Fri, 27 Mar 2020
 10:54:19 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 0/2] arm-autonomy: Add guest network bridge
Date: Fri, 27 Mar 2020 10:53:56 +0000
Message-Id: <20200327105358.507-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN4PR0501CA0057.namprd05.prod.outlook.com
 (2603:10b6:803:41::34) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.49) by SN4PR0501CA0057.namprd05.prod.outlook.com (2603:10b6:803:41::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.11 via Frontend Transport; Fri, 27 Mar 2020 10:54:18 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 63646c10-af88-47de-5d47-08d7d23d3789
X-MS-TrafficTypeDiagnostic: DB7PR08MB3450:|DB7PR08MB3275:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3275BCE4F0EFC19E9AF793B69DCC0@DB7PR08MB3275.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(86362001)(6666004)(5660300002)(6486002)(4326008)(44832011)(956004)(2616005)(16526019)(478600001)(7696005)(81156014)(8676002)(66946007)(36756003)(26005)(1076003)(316002)(2906002)(186003)(6916009)(66556008)(66476007)(52116002)(81166006)(8936002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 XTGCoyAFzuKXhtsXYIOcF4VeHZ7po7pll9HH+9cziKzpamfJB9BGx7JMVMuNiBVEZW3Ax7MNzti6yCaAlzpETnk1rstZDAiQVukjUvSYX9KUNL6G4LrZP7HCgcQ7GZZkLYs3tzrr459fGliilX5eWjB8Xnayh+FBYt86ZOTGkUQtVqD92j7cy9+1wWsG4Sm9Vyr2PPFJsRxa+rhpQZn/S/lmWq9GuwEeiuBXWqTRYVAs2cOCaTUElElEPmp1qBtA6lxwGWzIZjjlxQIMlefvMowmbk5oOBaW0AP4Gv+zhQX0N5KEcMz7M0mhxPEqZ3UdFuzu/8jJZqjBhLSBGvUE20TYpFOiQ1/qpRLMJagUx90nUyC5H+qJvzxcSF3Xhno5gDHn3h3WF1j/H7LzsiU196CvBe1gE1z2qXIqmKbYs+31Z7dqIV86a/3ERqQSOkgvRYVmXtmEXiaWoY9YdDfbLrATf5CkTrDCTiQ/mvUmkseWwCtj+kqV67giqESQoQ21tqaFZU0XlQejGoBNIHTy+ZUZCrFO/cdujfrVpp/SuJGGCPYgjlNrAAnPdINa6ThkXMOXsMVfjWTXmYNDBJ5UgkUmQ1HZeS66Us+cZJzev3dtAWd9rxlsX+Nnjtn5I/taESOyoMZXazEUF9Hwf4ji5Q==
X-MS-Exchange-AntiSpam-MessageData: 
 4C4bQYu/h29dJVWF4B5vuf2Fe8c8l5BOiKgbfehRPCPpmlDPYtJeO4udt5yansdKxkLl8SdYPQKhHwuBpCTfU7uBc7maPIuicAgKSQUUgtE2MBd9o2MYz2xYqBSZOcWRjFLcjYyNWWjxRCmUXG6TIg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3450
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966005)(47076004)(82740400003)(8676002)(6666004)(81166006)(81156014)(316002)(6486002)(6916009)(356004)(1076003)(7696005)(5660300002)(956004)(2616005)(8936002)(44832011)(186003)(26005)(336012)(16526019)(36756003)(4326008)(2906002)(478600001)(26826003)(86362001)(70206006)(70586007);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c90d3a42-aca4-477a-ca0c-08d7d23d339e
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1tPZoAPMEI4nlvkpaejJL3L+uA+CNo9gFWr9eawnLhDn1h1rPpEaIkAe+dtmeOvEWZ5G/4pWYLDmpLu4mmvQbYZuJqEXRbn+q+7V5bl6gKsx07xKQ9bO2IwqdkM2MWAGyW54tn5/2V+QLTu4vXLJmtQWNmjeF39bHwujpLzSTPoHHBEWOf9pgfC/giTb3Nln2rwOyUyBtgTcBO6Dgs94JCqfRKdPCEZ0F0OPzwy072dSGDU2KW2ScImiLmr1VH/Z5ve2Ut8oKh4rdg26wdaDpDoDqSr9UEn7oSZNA0VR9Fo8QTGJON7Eqi2ZQi+fCvG8Yem/sv60wI8DhxGqmzRDQCsPvLFFSXtOBCK1TBDlDfw/9AjEeraERuIKfJSGHi92u/3vDT7eUf5yziYe8zkPLFFomFT6kMXU3kHLZ1Qil04GNoy9BC7PVgj/1S3xpXMHMZGVvJbgR9Sn+VocAX+jtlmy7XVJOG1Oqwl16VWHwsJK58wCsDJNx5W4jA4+z+Zhf/B83YdpOlnZZo1yWaQmPYV3IY63xYZvDiop5hebHHpOGu4ANU3GTRxeiil/NjWUaxcrLtrfccF11FGInmQmjrkKOrNkIcdrWmKEqYFRp+S+IuLGFIpb5AZ00jmwRPYx+AleZflRdMHs5XaMnmFfapSz3CuC14D5Hf4gXUW0yzcwIvWRndAKpk6tNX4joOlsA86lV/+SE6JSJeooX5lRJw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:54:26.2731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63646c10-af88-47de-5d47-08d7d23d3789
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3275
Content-Type: text/plain

Create a system to have a network bridge on the host and connect some
guests to it.
Introduce a subdirectory support to ifupdown to allow to add bits to
the network configuration using extra files.

Bertrand Marquis (2):
  arm-autonomy: Add subdirectory config to ifupdown
  arm-autonomy: Create xenguest network bridge

 meta-arm-autonomy/README.md                   |  5 ++
 .../classes/xenguest-image.bbclass            | 11 ++++
 .../documentation/xenguest-network-bridge.md  | 49 +++++++++++++++++
 .../images/arm-autonomy-host-image-minimal.bb |  1 +
 .../init-ifupdown/init-ifupdown_1.0.bbappend  | 18 +++++++
 .../xenguest/files/network-bridge.sh.in       | 15 ++++++
 .../files/xenguest-network-bridge-dhcp.cfg.in |  3 ++
 .../xenguest/files/xenguest-network-bridge.in | 44 ++++++++++++++++
 .../xenguest/xenguest-network-bridge.bb       | 52 +++++++++++++++++++
 .../xenguest/xenguest-network-bridge.bbappend |  2 +
 10 files changed, 200 insertions(+)
 create mode 100644 meta-arm-autonomy/documentation/xenguest-network-bridge.md
 create mode 100644 meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
 create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-bridge-dhcp.cfg.in
 create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-bridge.in
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bb
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bbappend

-- 
2.17.1

