Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.87])
 by mx.groups.io with SMTP id smtpd.web11.3671.1588849727087094953
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 May 2020 04:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cj3OzRpZ;
 spf=pass (domain: arm.com, ip: 40.107.22.87, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t06GdjkliE49q+gmUg07YcpSu6u3awBcYE6xVKF/B3U=;
 b=cj3OzRpZJbLL2JkK0dha7PJVuBbMh1GQhtFO6N/YoaUxQsyA6WIbCJMFeUpkhiNJsinbY77KerB5/THZ8mfdhFVoISl42lFAkRMERf5J6NyigHjciWDIRJtYz2/oYpUIJ3wNe+mRDZSOQrLV5NWCqLRB6dAshgTUajH6yLBuUeQ=
Received: from AM6P193CA0039.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::16)
 by AM0PR08MB4385.eurprd08.prod.outlook.com (2603:10a6:208:148::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Thu, 7 May
 2020 11:08:44 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::69) by AM6P193CA0039.outlook.office365.com
 (2603:10a6:209:8e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend
 Transport; Thu, 7 May 2020 11:08:44 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 11:08:44 +0000
Received: ("Tessian outbound fb9de21a7e90:v54"); Thu, 07 May 2020 11:08:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7a2981d115f4a693
X-CR-MTA-TID: 64aa7808
Received: from cb7c2d31738c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4D72C62A-6B77-4230-9195-EFD9073A5AD4.1;
	Thu, 07 May 2020 11:08:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb7c2d31738c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 May 2020 11:08:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0rH2lDhgC91TdMjMMFZMEbCAWwItq1eqzbHf9rmGMEkUA4Wr2AZuIlhkJFzGEJ0q/Nd3ffDOFxEvuWgpzQkEcuKqd7AwHPlOjLPdt94ERP0LwgPYeIaCm+1tWWYPD+6zIUZgg+Eki79zGl5sET+WUmW1g6zSY8xnWHlMzGcx+tdBSB785NGQWeudR2U3QC6HQiZY6oRW6+wYAzLbYGFqG/mTVR6uekItGlRBIRkFThKTzJt28j2hYzCAWztaU0z+UrXuWhN0isbsRRjnUpx80GDAOqVGH7jmRRVzRJ2J0gShabJaOMMsB7c02r8PiaVpykHnIpgFAFwqQXQMMtlvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t06GdjkliE49q+gmUg07YcpSu6u3awBcYE6xVKF/B3U=;
 b=c4+wxD769t4JBBZorU3Al3YBGM4pgZsla1goXPOjIJO+DU2WuFSNoGcnMZT1Art4IGAwGWEcXEr9B/UcDiRxjnAhFiPe3Zs/+dnZQdqeHpraozdffUM9PeA1ycEogK7z46P/0C+P2bBXKO/EgCvTS2l4I/yw+1m+5+sLzg7/iFdwLZYFGuzsd+lvdLx/Fpo8yJMIczhf7+gRTpOdNcPl9EBL4CehcAPCplFfi4IVzHMfEcdpM6lstdQZusFv0YBMW+3JepqhSsAy8Ykd9I8fScqvQp3GTqkj+6SMupm1t5jnYUQedQG5b5SuBt5+nCjn+qHgEsq5GbO9Wj0KJUXQ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t06GdjkliE49q+gmUg07YcpSu6u3awBcYE6xVKF/B3U=;
 b=cj3OzRpZJbLL2JkK0dha7PJVuBbMh1GQhtFO6N/YoaUxQsyA6WIbCJMFeUpkhiNJsinbY77KerB5/THZ8mfdhFVoISl42lFAkRMERf5J6NyigHjciWDIRJtYz2/oYpUIJ3wNe+mRDZSOQrLV5NWCqLRB6dAshgTUajH6yLBuUeQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB2954.eurprd08.prod.outlook.com (2603:10a6:5:1c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Thu, 7 May
 2020 11:08:37 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Thu, 7 May 2020
 11:08:37 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 0/4] Reduce autonomy-host image size
Date: Thu,  7 May 2020 12:08:21 +0100
Message-Id: <20200507110825.38541-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LNXP123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::32) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.50) by LNXP123CA0020.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend Transport; Thu, 7 May 2020 11:08:37 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 31083a37-6367-4817-4a67-08d7f27701d4
X-MS-TrafficTypeDiagnostic: DB7PR08MB2954:|AM0PR08MB4385:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB4385725189552D718D4E82CC9DA50@AM0PR08MB4385.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 0LbACsGP5KEsrT0JAZSSoLST8OFD9SOlO5F/IeNpn8DvoJx71u+5MikFJtUJs/Ec2Me+cULaZiGcO4MyfjoaFhQiU2jwLcuDTNzfr6Y2CIHD4UrsLnStTuByWpfBV3o6Vg+Uh8ozAP9/oVm1cjJjh76ng5j4niMwAc+K8vmHJpg8Rx3MaRkBT6pDHKjUu1U519rqi8cs+vHIl2L9S2rA5WfJmS+NzE+O1/TJJw10uug2abv4WokmO0ITovEaQAzsKGdhiiuDC+kopGVwCRQnHsE39taiXDbxCq84MUqri/qFCLKRZliaQHnwWKJGk36sleB6xinpJVmnLC6CZq1eqRBGUuJkR1vMHQ7ghHQuGi4Cy/t62o257IfwSNXwEUN01c53R464j9PPpqleLvZB4LFZOBUkQbzaGvtLGP8VGvP2gLCsXbdKjv3+K4DloRYqXb0JmtrjbzPiMDn2uKRvBjMg6gUFN100EDISjhAGNmGbnmnKNywiL5nINWBp8IkRwX8La56bV1PeNi5zsIlhNw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(33430700001)(1076003)(16526019)(316002)(2616005)(8936002)(5660300002)(33440700001)(44832011)(66946007)(4326008)(66476007)(2906002)(186003)(956004)(52116002)(86362001)(83280400001)(83320400001)(83290400001)(4744005)(26005)(36756003)(478600001)(83310400001)(6666004)(83300400001)(7696005)(8676002)(6486002)(6916009)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 YsCZ2s7yDfLou98U3XbcUqocoNMsDdbor2VLeSera8kRz/Cxqr9A34CNERHXbmtdK8FIfIU4FOz2FHhNVRVpQWn3TzK5D9VMc3DqycmgkEjHdNYwqw7a86tYNr1LwK4oXsBypkke6WcKzblUHKmA1wqWDcR4y6tgEyM0vcwB2ylmS70Mou8llYDaWoxtozkyXWJDZ8IghSlxaSNr6mlJkT1sg+fYUQWaPK4lMZGfRifUvrcDZGbr66mNoFl3C0JBtlmC76rD7bRVaoob6tuUm5mhkY7WiA/rz8KhMnqFpw3hJj7UlKbj5lGErrVK5x20+kilt2oC8U1k6YT5YXrDXzBoYVkumt+xS/lCcQ5NKzf3aNijigXzqkGR911VBALvL3oh+w/CqZUxWXn3TcnrdqvU/12dBfKMRZv1Xla3kJVxIbuf1AEtKDOx8Y0fdCZOIZbWPG1iunnA8Ytlyu4lbZHiOCAgps7DyHH+7GuYkAqVVPJcFv5YgVtCc85OmgwaJoKgbdWoOvLBJ2JagR95/tAmTFdtQ/cBWuZ9GH0V4z3pbeyBh6T/7bOQ08rZ0V3uhiYGcD7D++YcCXLHHq5PdaBiyI3tRKcjPSNf7EF79AYAEUNTqcSVnNC67xO6/JtjPuQGbMSdeCK4gpNtS109PCWugdIxh8tNA+Q3PV/RWLT3UbipDUW2THv4AfD0nX4Blf23vDjHibxPFo16TXIlzx+NcuvbiZtALXrVhHCHKSr/BRu6CI39kz/bEVfOLcbup3QKB+5ApFgQb/QlB96yb3TlznZfjX8tO/427eHvYkY=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2954
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(46966005)(33430700001)(356005)(81166007)(478600001)(82310400002)(8936002)(44832011)(1076003)(70586007)(47076004)(82740400003)(336012)(2616005)(86362001)(2906002)(70206006)(956004)(6486002)(8676002)(186003)(5660300002)(16526019)(6916009)(4326008)(36906005)(316002)(4744005)(36756003)(6666004)(26005)(7696005)(33440700001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	00d1f767-a494-4314-9c81-08d7f276fdc0
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KuPPSt1Ix4f/0QiiaNpu+zqPeNgSrf0ul9RooykF/Ir1bngnxB7diHPDjDT64TWrUi9o0HSlSc4LMcfCdo8PgHoFD//ywapv3b1Nt91e8NBxuSqSqrFl2DHgSELniucXKfK4CtMFkSwW1kjn9OsTR5AQcLgHJkMPB1x96d17rY1Qu0sdmFcTc9qjCr3pgrM7S0rfGDqS/NlMPmACYQHHJy07qXDalMjVUkWexowqYFztWYJaHOGKAfPIiBHSz+R8mmbOu7YnPGXGyKQgH++wgtSOByiVMpBl6UONuhrnfyTXVTTko47F6s5M9UUDTAvd6ARgVC60BuHvt/ZbWpcNpZ/xjga1XzfdzmN/PcEHAFdroK9G2T+m8qK9YmSkovzB5n/JjXmcHca/mY37EtBUJu/eN5xQs6ySMtfDTQv/f8baShWf3r2lV3FbSAXsWkXofpHvpJNZgdF5AgIQNWvnreRgtO5M2vrvV1yVf7Azo9NY+3BlfNxe1ai7IxknC5uOauK5c3V43roA1n80F2o3og1gh0CwR6YkBia518AlnGBAxmR//C8m0uhWBO40HxpzjOwM7/KVHKsj3saYnV/omg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 11:08:44.1304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31083a37-6367-4817-4a67-08d7f27701d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4385
Content-Type: text/plain

This patch serie is doing several changes to reduce the image size
produced when autonomy-host-image-minimal is generated:
- only include qemu parts required for xen
- remove kernel binary and modules from generated image
- optimize qemu compilation to reduce the binary size

This is generating an image of around 120MB instead of 700MB.

Diego Sueiro (4):
  [arm-autonomy] qemu: Split qemu into qemu and qemu-xen packages
  [arm-autonomy] Don't include kernels in arm-autonomy-host images
  [arm-autonomy] qemu: Don't build with audio support when Xen is
    present
  [arm-autonomy] arm-autonomy-host-image-minimal: Remove kernel-modules

 meta-arm-autonomy/README.md                    |  1 +
 .../conf/distro/include/arm-autonomy-host.inc  |  4 ++++
 .../images/arm-autonomy-host-image-minimal.bb  |  8 ++++----
 .../recipes-devtools/qemu/qemu_%.bbappend      | 18 ++++++++++++++++++
 4 files changed, 27 insertions(+), 4 deletions(-)
 create mode 100644 meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend

-- 
2.17.1

