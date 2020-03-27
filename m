Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.85])
 by mx.groups.io with SMTP id smtpd.web10.8818.1585306251874981204
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Dg9G3Srz;
 spf=pass (domain: arm.com, ip: 40.107.14.85, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGu2UzEZnioL1Nj5gsjtvLUknp1DUABvPN3p2sVMf7E=;
 b=Dg9G3SrzYgdhw60nz7aVG3n8g91mIpgQLzm3WBcnDXJ8ydbXU9Ny2Q9pvRR6X6oyRARa2tOZy9+yW0k1UAS6hE8ltSGZ7LWD+v0+fQ/VTu+PdUjAmbhRfyFqObE0OmTjCvQAXNmCruIQ35MODObEkQOrjIhMw5NbkAA/TpdunGo=
Received: from VI1PR08CA0174.eurprd08.prod.outlook.com (2603:10a6:800:d1::28)
 by AM0PR08MB3345.eurprd08.prod.outlook.com (2603:10a6:208:5c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Fri, 27 Mar
 2020 10:50:47 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:800:d1:cafe::70) by VI1PR08CA0174.outlook.office365.com
 (2603:10a6:800:d1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Fri, 27 Mar 2020 10:50:47 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:50:46 +0000
Received: ("Tessian outbound e13acb17570e:v48"); Fri, 27 Mar 2020 10:50:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d2832e9bfda49417
X-CR-MTA-TID: 64aa7808
Received: from bf658d62e50e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F1E4CEA5-2819-4E47-98B2-9BACEB16E77C.1;
	Fri, 27 Mar 2020 10:50:41 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf658d62e50e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:50:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyCcHn8GZcTI0AoERhOJSkkEgPy9oQMg/4okCG9OpnSpM6n9oClpxkTzGGmPS1G8umVha8thDmcBao32faOQq0qgwG7cOdU7b3mcXPcTepUdhnRSfa03gGQTpF7cqPj9ypgIKeF8kxpbftPo/TOO2P3vw+NBwpBzAb89Pox6C9MEjhH7SoskCm3JA/pFqjuVsCNN9eRzb0c8bUWt52f3KcfQwmihJF1Yt/qSMeMgZjKrjHceiImFnLn4qUjLw4a53ZCI7cxJPphfu9oDZ1EDUaJJxV/yFWlkEXw97CDMl2YA83OtzqIWlIxUeAV0qeYMt1PshaKbKqB//c5M6JaHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGu2UzEZnioL1Nj5gsjtvLUknp1DUABvPN3p2sVMf7E=;
 b=lJhwtKwhCcrCu50U6HxaId7xg8o80asNxS7KESiDFYphP2+1UvE7jvxQsgbvxcgfwrLrfPXsjFuCeKtm6hKGRUuhBYKzeLTM0hWhMIBRFymZKOx2d9GNn5p8pcU/DfoFmV4lomx3VcN4OJ9HlD63Q7Ph+isCWFOoswrtvUXVuMydbJ/ji8ikVeboxIPd/0g64Aw+uatEU0dSNbkrNdVJndZSJ3+OkIWLuWs8caxkD388hIQPGgjmWLIE1SKLAnjozK/AkBR0zTNbTJcslp8ZCDimjuowXSjd/2NTHOhaw2pJFIaWNCv8rjlyMBM0oOccXblSdRKyCZPGGZoUew5zcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGu2UzEZnioL1Nj5gsjtvLUknp1DUABvPN3p2sVMf7E=;
 b=Dg9G3SrzYgdhw60nz7aVG3n8g91mIpgQLzm3WBcnDXJ8ydbXU9Ny2Q9pvRR6X6oyRARa2tOZy9+yW0k1UAS6hE8ltSGZ7LWD+v0+fQ/VTu+PdUjAmbhRfyFqObE0OmTjCvQAXNmCruIQ35MODObEkQOrjIhMw5NbkAA/TpdunGo=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3179.eurprd08.prod.outlook.com (52.135.130.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.18; Fri, 27 Mar 2020 10:50:40 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.025; Fri, 27 Mar 2020
 10:50:40 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 0/7] Create meta-arm-autonomy Layer
Date: Fri, 27 Mar 2020 10:50:03 +0000
Message-Id: <20200327105010.400-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM6PR12CA0036.namprd12.prod.outlook.com
 (2603:10b6:5:1c0::49) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.50) by DM6PR12CA0036.namprd12.prod.outlook.com (2603:10b6:5:1c0::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend Transport; Fri, 27 Mar 2020 10:50:38 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2af70972-3dd4-425e-ed30-08d7d23cb4d1
X-MS-TrafficTypeDiagnostic: DB7PR08MB3179:|AM0PR08MB3345:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB33451C0784494A18B9065BA79DCC0@AM0PR08MB3345.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;OLM:3513;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(8676002)(44832011)(6486002)(4326008)(5660300002)(8936002)(186003)(6666004)(16526019)(26005)(956004)(316002)(2906002)(81166006)(36756003)(66946007)(81156014)(1076003)(478600001)(52116002)(66556008)(86362001)(7696005)(66476007)(6916009)(2616005);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 O4gqhrasqvl/3viWASDGWuNM9IKd+VXorfMgRPowJCX7t3LFzgnSVMotAbCu8kS4pZMeBpG7l1fFyljN7aYwlVh4PDYdOQw+OVvJCRwzjbMGPEA2EpHrlV174g6b0ITx+J5ZSg6VLAaHFr9J4TtvROWp+XAmlXjiw1Md9Hte6BAwp1lKHWRR0Dm/VN9kE2f3MYMnako1DlBHtalQpl5OyLjPNnVLOBR4e8sAUVzT7yU5be1lqC4o+z9yfBsocfSKZCZopeQRv8ftPxSfbqdmtfcdc/n/RbqYcHaoB64o+oWVS0o4udKHyRb0S9DhReuhXknBbnRWwrZqKFxe49wNgkfcXS7+AD21JFBz21sLd35PTfhvNH7KYVW7iffViIsSawxQkoR7bAru6TzkZgLr4dnYhdK6LnZy7F3bOS5ZHqkdd3ucXHXbmftLh90EHWBSyFApq4NY5sk1aLweuXvokznW0xN/ukz6VgRAmI6924uRmIYxEHiRUpznvFdo/Yec6clN8EQ2/xKpSweK+kmtn7IFN3piBmmbozlTSjY9B1x/n11ub0OMYM8I7pj8KftoeHzD6AP0N++69YpD8fnCUI6EcWM9g3NldoYqPBH8Vw/hyAlQsW99VYPp86XwJNCHtqVRMLLDwjCw7sezb4L35w==
X-MS-Exchange-AntiSpam-MessageData: 
 k5SFaza2icPiRcmP/8ONo6WvmYv5ZqxHCpzUHkqYTz2ODoce66ZIrUS5oOTNZuOra4HDRP1ZDgZlrEGiS5ErsKz8oTU+TW/QQJdD6WXh7hc+vMsGSjednN1X1peDUKQWPAesqkpnPCIEj6R0+hZ6KA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3179
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966005)(2616005)(1076003)(316002)(6916009)(8936002)(70586007)(70206006)(36756003)(86362001)(36906005)(6666004)(356004)(81156014)(81166006)(44832011)(2906002)(8676002)(5660300002)(956004)(82740400003)(6486002)(7696005)(47076004)(478600001)(186003)(16526019)(26826003)(336012)(4326008)(26005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ea79bfb4-812b-43eb-cda6-08d7d23cb081
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nO5bAk1vXhY/NV+ZSbCw4cvAMh6EqeFAMcf3DEwd4ymkq+2Y2OjHDxwjgIQT4jkxB6I27twSLOYQl7qI9Vjuorc3z3AeO0gV2ZqanjhjDqRM7ATMukY6/eGMewkgTk8DkjlByzeGc3QXai1sWO9CiMGJ8UDYcXuegmL1i94KFc5tk/0oU15vG2J1B743g4Ax7Y8qFQ5g83heENLa11WPKbRr6PwBqYOanm06gqLl7tVHlBfjnrjlsT14H6X9Rc3qyUBm5GRiDBac8AT6zjjtdqNvOel2Zq4aAj1IgwcQpPdFBR47mNWKrBbl+rTj46KQG1/SSL49Qg3wPJ/jD1vyznKQVbXtjChzW/Zf3t/435JdoWZstk2SDo0KGgYT8Q2cOJ+962YXUoe+H7jJUmAxz1pjQl74MZk4qFtUEQe/sFGnB8w4Nv2PIG/Edq8Oydf0Lg3stwzH2GwSx7586RzLQ7HuJEaUivtbREYkwfvB0q4Eidtzn1dPZttFddOKCIs1/ZvSU8lc753FHUhr5tF9aKd5BPc7+aXQNYL0Efy43T9ILCXnPrEPRglDBAlIOiyCUbBWei0ZedW3PzwsF0jrMWawJs+K4LKoc5j3ZY6ZlfXztnAxqD/zb3qmJiGgaM0xVKlBLymSbzHo2U4PLrq6qoFKlG1CiyBz74gaHsmgIcKN7dYM2vRJEpEaqNh0texijqwxjsY24XN0l3lzMwpE0g==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:50:46.8663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af70972-3dd4-425e-ed30-08d7d23cb4d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3345
Content-Type: text/plain

This patch serie is introducing meta-arm-autonomy layer.
This layer can be used to create Xen based virtualized system suitable
for embedded systems.
It is providing a BSP arm64-autonomy-guest and 2 DISTRO_FEATURES
"arm-autonomy-host" and "arm-autonomy-guest".

Bertrand Marquis (7):
  arm-autonomy: Create meta-arm-autonomy layer
  arm-autonomy: Create arm-autonomy-host feature
  arm-autonomy: Create arm-autonomy-host image
  arm-autonomy: Create arm-autonomy-guest feature
  arm-autonomy: Create arm64-autonomy-guest machine
  arm-autonomy: Create quick start documentation
  arm-autonomy: Create xen-devicetree recipe

 README.md                                     |   3 +
 meta-arm-autonomy/README.md                   |  79 ++++++++++++
 .../classes/arm-autonomy-features.bbclass     |   5 +
 .../distro/include/arm-autonomy-guest.inc     |   5 +
 .../conf/distro/include/arm-autonomy-host.inc |   5 +
 meta-arm-autonomy/conf/layer.conf             |  31 +++++
 .../conf/machine/arm64-autonomy-guest.conf    |  17 +++
 .../documentation/arm-autonomy-quickstart.md  | 116 ++++++++++++++++++
 .../documentation/xen-devicetree.md           | 104 ++++++++++++++++
 .../images/arm-autonomy-host-image-minimal.bb |  30 +++++
 .../sysvinit/sysvinit-inittab_2.%.bbappend    |  16 +++
 .../xen-devicetree/files/xen-juno.dtsi        |  11 ++
 .../xen-devicetree/files/xen.dtsi.in          |  17 +++
 .../xen-devicetree/xen-devicetree.bb          |  68 ++++++++++
 .../xen-devicetree/xen-devicetree.bbappend    |  18 +++
 .../arm64-autonomy-guest-standard.scc         |   5 +
 .../bsp/arm-autonomy/arm64-autonomy-guest.cfg |   2 +
 .../bsp/arm-autonomy/arm64-autonomy-guest.scc |   6 +
 .../features/arm-autonomy/xen-guest.cfg       |  54 ++++++++
 .../features/arm-autonomy/xen-guest.scc       |   4 +
 .../features/arm-autonomy/xen-host.cfg        |  35 ++++++
 .../features/arm-autonomy/xen-host.scc        |   4 +
 .../recipes-kernel/linux/linux-%.bbappend     |   3 +
 .../linux/linux-arm-autonomy.inc              |  21 ++++
 24 files changed, 659 insertions(+)
 create mode 100644 meta-arm-autonomy/README.md
 create mode 100644 meta-arm-autonomy/classes/arm-autonomy-features.bbclass
 create mode 100644 meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
 create mode 100644 meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
 create mode 100644 meta-arm-autonomy/conf/layer.conf
 create mode 100644 meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
 create mode 100644 meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
 create mode 100644 meta-arm-autonomy/documentation/xen-devicetree.md
 create mode 100644 meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
 create mode 100644 meta-arm-autonomy/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
 create mode 100644 meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen-juno.dtsi
 create mode 100644 meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in
 create mode 100644 meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
 create mode 100644 meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bbappend
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest-standard.scc
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest.cfg
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest.scc
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.cfg
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/linux-%.bbappend
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc

-- 
2.17.1

