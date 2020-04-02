Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.70])
 by mx.groups.io with SMTP id smtpd.web11.115.1585847340930781560
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 10:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Yr8hQv4p;
 spf=pass (domain: arm.com, ip: 40.107.15.70, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMUN2FgH2DPyD9mB11JtX7QCym/BfhAt9SsKAwanJgM=;
 b=Yr8hQv4pv/BIb22wPGIgEmC8624QlqHzwDPJziqMU9EDT1+k241uUYLnruOaTKnQ8bXQDaK13nMbbMD4FfgoGml0XxD3Z2+udSbpvIqdgWgXSUhQygXEV0YLRyFJXm0I2WGXV3bcnGrQxsxdzfKRZwn5QvUZ3hxOkVpV+G1q8Gk=
Received: from AM6P193CA0078.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::19)
 by DB6PR0801MB1671.eurprd08.prod.outlook.com (2603:10a6:4:3c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Thu, 2 Apr
 2020 17:08:55 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::b0) by AM6P193CA0078.outlook.office365.com
 (2603:10a6:209:88::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend
 Transport; Thu, 2 Apr 2020 17:08:55 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Thu, 2 Apr 2020 17:08:55 +0000
Received: ("Tessian outbound af37c2b81632:v50"); Thu, 02 Apr 2020 17:08:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 18722be1bc762223
X-CR-MTA-TID: 64aa7808
Received: from f9216a78d281.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2B448243-C5AF-4EC3-9068-3C4EC788FD5A.1;
	Thu, 02 Apr 2020 17:08:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f9216a78d281.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 02 Apr 2020 17:08:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=breOPktuKwtfPofyYzVKt7D/xLmSNbz+KIoDCyFDL08ndbWsUAB+CP3Okh0CiUlKWlGsR855EDRgUgV4JkxLuH3lBZ79jGGFgdIUo/YlCsCYU0erPG4RdlY57Tkjxryjn/MqyQoITHKtl+MUC9DxvlQ4Kn9xp0sME52baynWoKRrY5MbW0Xs3bmKWS09KbR0p3Nf7TenFPdPTUsFumsT6+YSMf/c2iOU1LJOkvZi4XQ1G4nBCmtiujoHwRVTw/s+VPVjmXCkBq9FIze7yFaPs5OZ3EsxT7DxXBONDvHInzHmcmyWD15bqeFY3+f3PJcAJMAmyVdFnSIjwcHondtg9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMUN2FgH2DPyD9mB11JtX7QCym/BfhAt9SsKAwanJgM=;
 b=eDjLeGrboW/7p9xsbesB1bKZyR2+E7PBaxTD76G0UsihjGebnxKPTzR+lWpS63zDdadDTBwIA905RQVJApsxgqU5zlTdqxWOtnonB7NY5V9VT5PdsocAY8ImBxkHYMFTi1oToeoOqctLfwZ+H2cT0iI6TVywxQWmfuqmzu/qlspcwfUtfXsEu+SSc0zyJztZYgvHdM14PfjNRX8v+iIXzJCOq77xvWCqOJIdt6Tu84y/CeqA/LUKx5BQoRtM/xq0JwdEYitQl/u+KA/roqgVdDQuMjGPKlFb0fr9qiGU14Srmnhta7yzy/+xiseanu+Sirg1NsFIa2H8F4u6SPg1ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMUN2FgH2DPyD9mB11JtX7QCym/BfhAt9SsKAwanJgM=;
 b=Yr8hQv4pv/BIb22wPGIgEmC8624QlqHzwDPJziqMU9EDT1+k241uUYLnruOaTKnQ8bXQDaK13nMbbMD4FfgoGml0XxD3Z2+udSbpvIqdgWgXSUhQygXEV0YLRyFJXm0I2WGXV3bcnGrQxsxdzfKRZwn5QvUZ3hxOkVpV+G1q8Gk=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3801.eurprd08.prod.outlook.com (20.178.46.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Thu, 2 Apr 2020 17:08:46 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 17:08:46 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 0/7] arm-autonomy: Introduce Xenguest system
Date: Thu,  2 Apr 2020 18:08:09 +0100
Message-Id: <20200402170816.8818-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: PN1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:1::26) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.53) by PN1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend Transport; Thu, 2 Apr 2020 17:08:44 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a00d35f4-1d2f-4ccb-5418-08d7d7288690
X-MS-TrafficTypeDiagnostic: DB7PR08MB3801:|DB6PR0801MB1671:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB167108EC06A0A00E883F21189DC60@DB6PR0801MB1671.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-Forefront-PRVS: 0361212EA8
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(8936002)(5660300002)(66556008)(44832011)(2906002)(4326008)(66946007)(8676002)(66476007)(6666004)(6916009)(26005)(186003)(1076003)(81166006)(316002)(52116002)(478600001)(86362001)(6486002)(7696005)(956004)(2616005)(16526019)(81156014)(36756003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hrz51vCSSmgkmrwbenEZnPCJEY7ahWuxKItFnvu2jF8C/3ehgZtKYeCU3A2M5a5Mv9ajIEv0dDXPlI8dxCm7NrAhsiKlQWWDUm/hDkT3k/zkjBc+IJfxWcqWubF4XkLNqK1pLP3ZgH0LmtUTdUG/cKR5CoNJc9hti6DeDyuywo0cYUl1lsD+0VFSuLz5wJ+7wKJImPH7fZa2CVrG/MBbLPFTVZFXRWoz9rGpaimAGl9oUn08puBlwexIjmbKB3elIsQKOeKndqb0Pzs2QJQXX41OszQup9cm09EVUyFdEW9hbT3ghlK9eF1p0Y6gEoY4STfs51dkcxXmk7L0VZdMXcnvIG5nxfX27554qNgHc4gYV9h7MuO/iCBdEkLH73SuKYk0HTQ4MdNMyQV67x1FS+lAKi2CqimjV2n4siwZbA2NKwgcbL1eRXkDPHaDet1y2DQc2lEdpnjseiXIvIxvFAyKZtRYrHvMEgxGGAJP9FGlV1cSMTQp/bk2RFexp43sqLqiiw8AooNFzfC5Fe9J7Wtn/4D9UjyTH3kF0ijukV97CdG1jAsU7wK6NrFByjm55PgM5JU8X/rHJ3ZrkpBO6UF1USckTZ6Z6msABYUHVa58cSPZct+FzJNd1fyZLrkrafX2FP+hUno6wcoJZm1xUw==
X-MS-Exchange-AntiSpam-MessageData: 
 YuhMH/2Kc2CA8YohQsmMEQanW9RcgKyr2VqAHZVRnYOtTtkSRGmt7O8g8uBVBfz2yOqnu5ClYxyzIfME+/wMm+xX3mhAawi1T0xoq1j4to6aoS+Pd2zgZJRfnv+FnpGIw2+drsN5Ia2f94hr0wVYEw==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3801
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966005)(2616005)(956004)(44832011)(336012)(70586007)(70206006)(26005)(186003)(1076003)(6486002)(47076004)(82740400003)(16526019)(478600001)(81156014)(8676002)(8936002)(81166006)(6916009)(2906002)(86362001)(7696005)(6666004)(356004)(5660300002)(26826003)(316002)(4326008)(36906005)(36756003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	db5a9573-2ae3-4479-a3ab-08d7d7288149
X-Forefront-PRVS: 0361212EA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+Rsb+xLWVRGfwZ/bYkCqPi5b67hzKrp7aeXGVAiThuf3nOVe24U3kUYz7rabe4HFqdvIbFzO/2XGbAQyKDLu82PDVZ8ZSlFz1Vnv99E6ziuIBEGrrJPlwvYsZsl3s0FhidzxJKbN09CvRsqXeh2aekE5U2QiQJ2wrMuG9sVv6bRchvmAyYUNncTt4cBuvnz0JZ+oqGvv/iyZmM504Q+K5uxYkx+T6RlWHVySXkjbkvt4g2BKg5dPoQtuXbt3a0IoiGMS9RPRKGkQsWeA+lJE5NYzrEBBhIrclPgII1Jd6wAyF9Qg7KP6pSlJm2E+xiyGE1hnIeFTb9Md8PyMUMGF7ZBjc8bkvXOx6QJpUbjlp8bMgQ3urGks3pryxmjsFxk/8d3pS9KBzLQv4dFj2Y5xWmnulAmCdhUJTdAV85ZDyLBA4TDF104nDMc7NFOPhm4sMYVgy937VwwRUeapCsQTmm83RiDCLokIxs2X8ojdJNCJ4KCD9cA0vyWVrJNNJgqoMgklwH29A04qwv5zZizpCKFnY6SlOHXNPSwKMfNuO+PIgHw8UQWrjC1oW21HXWbXYti5QevNKojdAQELXb43MmN53vQrRarJybfUjEUXT7HpdqdwY909NxrRdHU6ncBnG4lUUOGFY4Kt4CI3JYVCR1lv6hZhBZCANNX1q3yJ7dZxnorylBAqf079LUE/CPrSdSmPC4YodhC7nbtlFlNM/w==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2020 17:08:55.1483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a00d35f4-1d2f-4ccb-5418-08d7d7288690
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1671
Content-Type: text/plain

This patch serie is introducing the Xenguest system. It is introducing
an image format to store a complete xen Guest inside one image file.
The serie is adding Yocto recipes to create such images when building a
Yocto image.
It is also providing tools to use such images in a Xen Dom0.

Changes in v2:
- fix error in disk add files in image-extra-class
- fix several script errors in xenguest-mkimage
- fix base-image handling of extended files

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
 .../xenguest/files/xenguest-mkimage           | 772 ++++++++++++++++++
 .../xenguest/xenguest-base-image.bb           | 119 +++
 .../xenguest/xenguest-manager.bb              |  52 ++
 .../xenguest/xenguest-manager.bbappend        |   6 +
 .../xenguest/xenguest-mkimage.bb              |  31 +
 .../xenguest/xenguest-nodisk-image.bb         |  38 +
 16 files changed, 2362 insertions(+)
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

