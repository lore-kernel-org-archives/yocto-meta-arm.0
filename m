Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.63])
 by mx.groups.io with SMTP id smtpd.web10.6438.1626953648591024467
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jul 2021 04:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Tv4lujPf;
 spf=pass (domain: arm.com, ip: 40.107.22.63, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj+PDdibgk+Pwx3xTUM/hlzDn2kbwWvWPUwT5vT7Ov8=;
 b=Tv4lujPf0PNtlF9BhqiTMVTRCXWY/q9TphixGBF4k0C7uHmR5yv6jpb3y8S9OQzfE4v8uZA1vxSdK0UN8nNhnzEaWlKyur+idn/SI2IWGvLGVlFhwd8DAobWgtLyHKPBteUjnLA08+saA1BjmvzfQd1ouoGntNrj26QB4E/agPc=
Received: from AM5PR0301CA0019.eurprd03.prod.outlook.com
 (2603:10a6:206:14::32) by DBBPR08MB4443.eurprd08.prod.outlook.com
 (2603:10a6:10:c8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Thu, 22 Jul
 2021 11:34:04 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::5) by AM5PR0301CA0019.outlook.office365.com
 (2603:10a6:206:14::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Thu, 22 Jul 2021 11:34:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Thu, 22 Jul 2021 11:34:03 +0000
Received: ("Tessian outbound 870783c3513f:v99"); Thu, 22 Jul 2021 11:34:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8db9ffa50757e039
X-CR-MTA-TID: 64aa7808
Received: from be3524b31fab.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 950AF56F-713D-4C88-A46B-444D73D3BD3E.1;
	Thu, 22 Jul 2021 11:33:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id be3524b31fab.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 22 Jul 2021 11:33:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTnSut/kfICWNVUzfrGUq3B0b/ZCsH4Q14KFluqINptSxtboBfA4UgfYBYPCuKaqQAQPQuowAbk08L8DrKXGl7s61ZQaBReGp9guMzM6GDrICDqEYzMP54FhVwhYpRcVF9seSxahxF3dfHiCDV+Z4YDmJZJW3vB3k0/xpwWVyMJlEMKLUf+idKNHvjzE9YQC5NsbXw/pyaXdYDOkahzEhpuOJMCHSBNavhfLmt6rxnoJmFL0vjkbLV/wugFLWFJpYk9K6AOkyXB2TtCoX7b3S5B1EUebIrsAQ0c8c9DgWQCb2xbKQl3HzSeLhdFAuZv9K3lfS1d58blbJkMZGkfqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj+PDdibgk+Pwx3xTUM/hlzDn2kbwWvWPUwT5vT7Ov8=;
 b=FbAC6A+2RuWLGfoU/FejzHrgth+I1DwWWVc7uu1cP1IqIha02vIlauBTfGj3D/48gUsTlIxQXmfxArXdJ/Aed3KcXB0flQKsr56vV+EBw2ePc7KJdHVWsrotJ4v1hprLv3w28tC1uxF5DJ+KrqbskkPf193/YUmvaIp4zhP+Yx5wUkZFBIXImYmTilkIhmMub4xu/FUNy8CiHrw7W2Z7nLM+6YMyvda2KLW/Rtx/AZ6OJHi7b3eoZ330/OvddAiiaiYS7+a29S+O0xNJJxyiXOf+HvZur9Svg1SOXDZsszpu79Hus55y7Jq+lBbHa9LKKT0d1fW0lqY0VLXWnguzAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj+PDdibgk+Pwx3xTUM/hlzDn2kbwWvWPUwT5vT7Ov8=;
 b=Tv4lujPf0PNtlF9BhqiTMVTRCXWY/q9TphixGBF4k0C7uHmR5yv6jpb3y8S9OQzfE4v8uZA1vxSdK0UN8nNhnzEaWlKyur+idn/SI2IWGvLGVlFhwd8DAobWgtLyHKPBteUjnLA08+saA1BjmvzfQd1ouoGntNrj26QB4E/agPc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com (2603:10a6:102:136::18)
 by PA4PR08MB5950.eurprd08.prod.outlook.com (2603:10a6:102:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Thu, 22 Jul
 2021 11:33:34 +0000
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::b4c4:746b:9a5e:2a34]) by PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::b4c4:746b:9a5e:2a34%7]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 11:33:34 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 3/6] arm-bsp/tc0: Update optee to 3.14.0
Date: Thu, 22 Jul 2021 12:32:47 +0100
Message-ID: <20210722113250.3394087-3-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722113250.3394087-1-arunachalam.ganapathy@arm.com>
References: <20210722113250.3394087-1-arunachalam.ganapathy@arm.com>
X-ClientProxiedBy: LO2P265CA0241.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::13) To PAXPR08MB6766.eurprd08.prod.outlook.com
 (2603:10a6:102:136::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.53) by LO2P265CA0241.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8a::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Thu, 22 Jul 2021 11:33:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 696ddabb-e5a2-4f4e-3f85-08d94d049bef
X-MS-TrafficTypeDiagnostic: PA4PR08MB5950:|DBBPR08MB4443:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB44435546FB1B4D42FA754A9AFBE49@DBBPR08MB4443.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:353;OLM:353;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: nDvY2W1T2Lz7hV7zWaXpEkwJkvZlHnfTfxQH3zVOiOCpLcK4YsoXqpw1Q28LpbcuT3XRD0pm//GYhUVdylH39IsqQR/I6H0z3js4eoZMHeAhm4YlPCZNMhrpUh15U4VP8sfkZFDiBymkgSu4X+JxQDJLS60HaRql6Ju0/Adc3iIkk6OpHhSRjQkpF8smyfiKadhC3m1xPXRl/tCzN30alotW/gWEL0X9oVscxSYcdHSSZxlNzM0PEj2FJWFV2jdTzBVKY/s++J1/DoNoOQ6YypwCMQM8dCwoteUXALUlp2s33pvZPne3A4paN0hGGd/qFi5hbbpKfY3H4zCGUTIFlEYsFXfM04nLuqi34xyZ94favWem1XZu8tHuvGTV5dBHuoWeAR6P97+QjCepRuU3ly0b9sbGLMTVd13M6qUSl5Y53nuUKKrlpQCXt4I3oPDALe6br2AeAmXBLZfqNERBc4dm54d8Fk1o74SPkKQSYXtb4ggn50amR73Bs87t1UmSzyw3m5b55d8B2lXwhd7pAl6trLc5ctogk3wJ9uRDuhLUF5LogsosUw9qsRqehGMrR6qr+dEXjeMuuvg3n+yTXyejeJ7f9ASNi4MH3aGOdilwHAODLnjstS+YtJNf2T20KDQPiVL+ghca3OQhutnM21qrODt746zR+uLD0azD4YIMVTMw9oXt4xGAZfCmkUjzfhAaZAydU0cngBXLX0IYi+PFS64I3DTnl1jMa0TS9pknnxZOut4UVpjUDdbEnJ9w+7trWzxTWs/VNvcHWkeb/1zdQ8yw0s+tjxSdnxvr/wyHgWHIALgEq6Y6EWi8r6HlLtuNUDy6GnG6xaklkp2Zc/vq1UZPctVLF8AEJ7d7LB4=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6766.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(6486002)(966005)(8936002)(38100700002)(5660300002)(44832011)(186003)(36756003)(26005)(52116002)(6666004)(66946007)(66476007)(86362001)(508600001)(4326008)(19627235002)(66556008)(8676002)(2906002)(2616005)(83380400001)(30864003)(1076003)(15650500001)(38350700002)(956004)(7696005)(6916009)(21314003)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S08ZQlXSDB0iWRBwvyibM5s7dIIlCx48q0aU1D+lhSch2Udz+B0CCGu2qPcs?=
 =?us-ascii?Q?Iy8zl2OwxMoT66nchLEK2lGhPmUtAaxz1f/p4PGAA1hHcNYxYRixN4RM2IKD?=
 =?us-ascii?Q?4y1AsElrdecaRnfLrF4YLdyYk7YueIcGjAaFqAaWM5MFc0VVu0Yqxk69m8J9?=
 =?us-ascii?Q?yRRfCuNAl+nNikQquX+RGZ4kTL1oNzzbuCfXgIn7W+l19wGkN0DG5RJ4Yfy1?=
 =?us-ascii?Q?cAZ+Dwtz1ppTahQhpjckQsph29P/ufh62+wIieyBxb7uEc3cebolg2rC5vHX?=
 =?us-ascii?Q?zVbQU33MwhWppHHk4iEzaCzg2yGXTtdaYzaVZUQMYrGodmgHehWO0bMFBDzP?=
 =?us-ascii?Q?NY8W73sj3Dp/GhcUZaSqQ2s3owYidgMWtT/+el3cEr484/E96AZmCzl29398?=
 =?us-ascii?Q?3RJumRYNT+nIRxro5yWIKk+P5miU5iI3aH5JhrLD9c5V8o3uMhrH7fKWdmL4?=
 =?us-ascii?Q?NkbJkW/r8drzBxvyRV4bp73IHzBwQoh7+7m5b/qJmm3r0tXcveBnK7hBYEfL?=
 =?us-ascii?Q?NqN9A+70lh9pyoE30nqtjn2eqYhWRUu2KsD5KiC1sUNgxZ8xu/yui3bDZudm?=
 =?us-ascii?Q?gtpebFhpWzWRB2q3TE+CFWmipPXpDvDjKitbW/LbbTKFFkZlgSTwzIltBro9?=
 =?us-ascii?Q?gYV0/oOWOwVf5LvMGyC+sE6YOfli6oNyFyJXNoWIegwaPHgC1+xkwgFQ/61a?=
 =?us-ascii?Q?jVee1+cy3ITh2RZBlFAZuB7UGmnI5y5AuTwp8GkWjwpWDpm+CxYYFgRXPKzr?=
 =?us-ascii?Q?z91YwvaBhCk/pUVGZpJr035WEZQMrhkKAPymEcZb4YOV3QixZUJ5ZTOWvYo9?=
 =?us-ascii?Q?M06oVDeavyFyud/fihMkOM+BFD0YDYH9MY/PfglgyTfp4eetjZ/eAC2v/T6J?=
 =?us-ascii?Q?TYe/RFuwblJCOG5mneOhf0nids9VSNqIepsQAhnyVlM9t37JzyjWaQ7WN1wF?=
 =?us-ascii?Q?AIF8wJjfLphavJdaZX7U/pkUxzpUCWked8FlRrBJ1BaNdbEYlvIWB+y6LsgH?=
 =?us-ascii?Q?nfpdejCYHKKyMEKvlQmQ5GD1KT4K/9f7X4sqhfCF1R2QcjBkfk91/phh2MRk?=
 =?us-ascii?Q?ZtElCsMtXaUiX5Jzrz3MUgwS6XzDW+AQpI1sSdtnCtdN8IJx/3y73aWLOFq7?=
 =?us-ascii?Q?aGR8pAaBQnlnc1w439T4q75SOHGGdCmVDae1vjll9tgW2dobYDuMhsdJXzwy?=
 =?us-ascii?Q?w43oTYqcLxk2pKirffCJUrUF04kqHNXi9sAAc65wfM7PK23vTHxr4Y3ZeGrR?=
 =?us-ascii?Q?4+j3o2Ufpo28cT2bhZmSHpGSv+aSzubY600ltLDerkVKjLK6VKCQIvrdsZn/?=
 =?us-ascii?Q?LArSdkVvN96rL31tRG874Xqw?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5950
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cef33667-6675-4f8b-42e5-08d94d048a47
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	C2L3GepIDDTsa02ByfiZLN0oci/kP/U2NQ/9r1ZJQOnPnY1s+5ycW8abFWmZXHJCuIQri/GQzsyf6pihuPqjlwq5e5Ynb/WVOR3XMx4LB9rEpX2BYzDzbepcnb6FVjJoHp6/F0KF2elXaeADjRDx1m9n4MYZuDVc/BQnpQD2PYIF2ZGLFG9AqHGWKvd+hNk+fYFhN0dhD0zxNhJytHZK5V8cgE/Ieq/3YPNWVJHZzw6WjqGz+62X8jSlONs2/3I0+1Ie3ym0ScjYzrMCxybTNTbikBEYVvPHZ1ayJ6RjCh1hdV+AdNYr65x33GhnfI7xnnSyIKbR1JtBsxgH5B/g+is8VmrDEhS9O3N1utl8cHishkyMp7l9e1otU/SF/YtjM6jrzl/tMaMeu/3F84kZDpdvdnadtB6aMhGOsCkgrbEGczuy7mzIcOSD+opRuoSL3ln9nCFj0YG6QF0/fqzfT4QCY8PznJ0ePe0MnVn8pNKHh55eeF8a+YRN2AqA1jiZ0mtuGlyUKCTrLDJTCUfK8XnE6GXEyP+BTp5/GGqsvG6I3cKtjGh2b+yUXkDCifuXm3M4sXHS8LCxyyIL8icTD46LS5GdONjKTmvC9yDOY85eet4KEIiimxcRngcxPBsKWf751ahck1an20fqqLnbj7Id2VSBQHqgEJoSy/U6fXx6PvevqXgXDgVlGA1Vhvo4pWyZiqQQtgLKkruvXijDVBGvZB62+7NWWKnDqqRcVLBJHewMYJn7DOfa3ufyDVXWpyI4fHSkOLE3qQgaRZVGwFjQ9IsfOBUBlBUAtHRr3U3DrACqVcVeqC2UFv557OWWNFnU5TSJYuXuXhj5jylmgAX497ckEB7RV5b6czlruhs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39850400004)(46966006)(36840700001)(36860700001)(30864003)(19627235002)(47076005)(82740400003)(336012)(44832011)(966005)(36756003)(2616005)(6916009)(956004)(6666004)(1076003)(81166007)(478600001)(316002)(8676002)(186003)(83380400001)(356005)(82310400003)(8936002)(2906002)(86362001)(5660300002)(4326008)(7696005)(70586007)(70206006)(26005)(15650500001)(6486002)(21314003)(579004)(559001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 11:34:03.9452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 696ddabb-e5a2-4f4e-3f85-08d94d049bef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4443
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: Ic70bcab5a3e0b7ccf6deb9a0dc3efe21112995fa
---
 ...void-memcpy-when-using-TEEC_TempMemo.patch |  52 --
 ...e-page-aligned-shared-memory-buffers.patch |  95 ---
 ...ore-SPMC-update-for-FF-A-version-1.0.patch |  50 --
 .../tc0/0002-core-add-thread_smccc.patch      |  89 ---
 ...e-enable-SPCI-with-SPM-Core-at-S-EL2.patch | 623 ------------------
 ...fixes-to-align-with-upstream-hafnium.patch | 188 ------
 ...e-arm-Total-Compute-platform-support.patch | 187 ------
 ...alcompute-Add-support-for-S-EL2-SPMC.patch | 108 ---
 ...e-add-optee-manifest-file-and-sp-lay.patch |  73 --
 ...e-define-tzdram-start-address-for-S-.patch |  36 -
 ...totalcompute-add-Theodul-DSU-support.patch |  93 ---
 ...P-declare-device-regions-in-manifest.patch |  47 --
 ...TEE-SP-use-CNTVCT-in-place-of-CNTVCT.patch | 173 -----
 .../optee/files/optee-os/tc0/sp_layout.json   |   6 +
 .../optee/optee-client-tc0.inc                |  11 +-
 ....bbappend =3D> optee-client_3.14.0.bbappend} |   0
 .../recipes-security/optee/optee-os-tc0.inc   |  39 +-
 ...11.0.bbappend =3D> optee-os_3.14.0.bbappend} |   0
 .../recipes-security/optee/optee-test-tc0.inc |  11 -
 ....0.bbappend =3D> optee-test_3.14.0.bbappend} |   0
 20 files changed, 16 insertions(+), 1865 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-client/=
tc0/0001-Revert-libteec-Avoid-memcpy-when-using-TEEC_TempMemo.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-client/=
tc0/0002-Allocate-page-aligned-shared-memory-buffers.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0001-core-SPMC-update-for-FF-A-version-1.0.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0002-core-add-thread_smccc.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0003-core-enable-SPCI-with-SPM-Core-at-S-EL2.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0004-core-fixes-to-align-with-upstream-hafnium.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0005-core-arm-Total-Compute-platform-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0006-plat-totalcompute-Add-support-for-S-EL2-SPMC.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0007-plat-totalcompute-add-optee-manifest-file-and-sp-lay.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0008-plat-totalcompute-define-tzdram-start-address-for-S-.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0009-plat-totalcompute-add-Theodul-DSU-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0010-WIP-OP-TEE-SP-declare-device-regions-in-manifest.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0011-WIP-OP-TEE-SP-use-CNTVCT-in-place-of-CNTVCT.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
sp_layout.json
 rename meta-arm-bsp/recipes-security/optee/{optee-client_3.11.0.bbappend =
=3D> optee-client_3.14.0.bbappend} (100%)
 rename meta-arm-bsp/recipes-security/optee/{optee-os_3.11.0.bbappend =3D> =
optee-os_3.14.0.bbappend} (100%)
 rename meta-arm-bsp/recipes-security/optee/{optee-test_3.11.0.bbappend =3D=
> optee-test_3.14.0.bbappend} (100%)

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-client/tc0/000=
1-Revert-libteec-Avoid-memcpy-when-using-TEEC_TempMemo.patch b/meta-arm-bsp=
/recipes-security/optee/files/optee-client/tc0/0001-Revert-libteec-Avoid-me=
mcpy-when-using-TEEC_TempMemo.patch
deleted file mode 100644
index 4515c1d..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-client/tc0/0001-Rever=
t-libteec-Avoid-memcpy-when-using-TEEC_TempMemo.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Upstream-Status: Pending [https://github.com/jenswi-linaro/optee_client/co=
mmit/7e569bdf770f635c5de1f4e659d41039a6199a0b]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 7e569bdf770f635c5de1f4e659d41039a6199a0b Mon Sep 17 00:00:00 2001
-From: Jens Wiklander <jens.wiklander@linaro.org>
-Date: Wed, 11 Nov 2020 10:09:38 +0100
-Subject: [PATCH 1/2] Revert "libteec: Avoid memcpy() when using
- TEEC_TempMemoryReference"
-
-This reverts commit dcb13e2f457fa98e9ba49dd2a364542680671e95.
----
- libteec/src/tee_client_api.c | 14 ++++----------
- 1 file changed, 4 insertions(+), 10 deletions(-)
-
-diff --git a/libteec/src/tee_client_api.c b/libteec/src/tee_client_api.c
-index 6b81e09..b8ccdfa 100644
---- a/libteec/src/tee_client_api.c
-+++ b/libteec/src/tee_client_api.c
-@@ -217,15 +217,11 @@ static TEEC_Result teec_pre_process_tmpref(TEEC_Cont=
ext *ctx,
- 			MEMREF_SHM_ID(param) =3D shm->id;
- 		}
- 	} else {
--		shm->buffer =3D tmpref->buffer;
--		res =3D TEEC_RegisterSharedMemory(ctx, shm);
-+		res =3D TEEC_AllocateSharedMemory(ctx, shm);
- 		if (res !=3D TEEC_SUCCESS)
- 			return res;
-=20
--		if (shm->shadow_buffer)
--			memcpy(shm->shadow_buffer, tmpref->buffer,
--			       tmpref->size);
--
-+		memcpy(shm->buffer, tmpref->buffer, tmpref->size);
- 		MEMREF_SHM_ID(param) =3D shm->id;
- 	}
-=20
-@@ -388,10 +384,8 @@ static void teec_post_process_tmpref(uint32_t param_t=
ype,
- 			TEEC_SharedMemory *shm)
- {
- 	if (param_type !=3D TEEC_MEMREF_TEMP_INPUT) {
--		if (MEMREF_SIZE(param) <=3D tmpref->size && tmpref->buffer &&
--		    shm->shadow_buffer)
--			memcpy(tmpref->buffer, shm->shadow_buffer,
--			       MEMREF_SIZE(param));
-+		if (MEMREF_SIZE(param) <=3D tmpref->size && tmpref->buffer)
-+			memcpy(tmpref->buffer, shm->buffer, MEMREF_SIZE(param));
-=20
- 		tmpref->size =3D MEMREF_SIZE(param);
- 	}
---=20
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-client/tc0/000=
2-Allocate-page-aligned-shared-memory-buffers.patch b/meta-arm-bsp/recipes-=
security/optee/files/optee-client/tc0/0002-Allocate-page-aligned-shared-mem=
ory-buffers.patch
deleted file mode 100644
index 5928bfd..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-client/tc0/0002-Alloc=
ate-page-aligned-shared-memory-buffers.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-Upstream-Status: Pending [https://github.com/jenswi-linaro/optee_client/co=
mmit/7a67f8b7681ecf3abb5b09e5e320857d16f4a7e6]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 7a67f8b7681ecf3abb5b09e5e320857d16f4a7e6 Mon Sep 17 00:00:00 2001
-From: Jens Wiklander <jens.wiklander@linaro.org>
-Date: Mon, 16 Nov 2020 17:34:07 +0100
-Subject: [PATCH 2/2] Allocate page aligned shared memory buffers
-
-Allocate page aligned shared memory buffer guarantee that each shared
-memory buffer doesn't accidentally share a page of memory or they may
-become aliased when mapped in secure world. This is normally not a big
-problem but may make it a bit harder to track down buffer overruns in
-shared memory buffers.
-
-In a post Arm v8.4 architecture with FF-A [1] there's trouble since it's
-not permitted to share the same physical page twice.
-
-Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
----
- libteec/src/tee_client_api.c        | 14 ++++++++++++--
- tee-supplicant/src/tee_supplicant.c | 12 +++++++++++-
- 2 files changed, 23 insertions(+), 3 deletions(-)
-
-diff --git a/libteec/src/tee_client_api.c b/libteec/src/tee_client_api.c
-index b8ccdfa..676d373 100644
---- a/libteec/src/tee_client_api.c
-+++ b/libteec/src/tee_client_api.c
-@@ -74,6 +74,16 @@ static void teec_mutex_unlock(pthread_mutex_t *mu)
- 	pthread_mutex_unlock(mu);
- }
-=20
-+static void *teec_paged_aligned_alloc(size_t sz)
-+{
-+	void *p =3D NULL;
-+
-+	if (!posix_memalign(&p, sysconf(_SC_PAGESIZE), sz))
-+		return p;
-+
-+	return NULL;
-+}
-+
- static int teec_open_dev(const char *devname, const char *capabilities,
- 			 uint32_t *gen_caps)
- {
-@@ -790,7 +800,7 @@ TEEC_Result TEEC_RegisterSharedMemory(TEEC_Context *ct=
x, TEEC_SharedMemory *shm)
- 		 * we're not making matters worse by trying to allocate and
- 		 * register a shadow buffer before giving up.
- 		 */
--		shm->shadow_buffer =3D malloc(s);
-+		shm->shadow_buffer =3D teec_paged_aligned_alloc(s);
- 		if (!shm->shadow_buffer)
- 			return TEEC_ERROR_OUT_OF_MEMORY;
- 		fd =3D teec_shm_register(ctx->fd, shm->shadow_buffer, s,
-@@ -873,7 +883,7 @@ TEEC_Result TEEC_AllocateSharedMemory(TEEC_Context *ct=
x, TEEC_SharedMemory *shm)
- 		s =3D 8;
-=20
- 	if (ctx->reg_mem) {
--		shm->buffer =3D malloc(s);
-+		shm->buffer =3D teec_paged_aligned_alloc(s);
- 		if (!shm->buffer)
- 			return TEEC_ERROR_OUT_OF_MEMORY;
-=20
-diff --git a/tee-supplicant/src/tee_supplicant.c b/tee-supplicant/src/tee_=
supplicant.c
-index 94cf382..d590c2b 100644
---- a/tee-supplicant/src/tee_supplicant.c
-+++ b/tee-supplicant/src/tee_supplicant.c
-@@ -127,6 +127,16 @@ static size_t num_waiters_dec(struct thread_arg *arg)
- 	return ret;
- }
-=20
-+static void *paged_aligned_alloc(size_t sz)
-+{
-+	void *p =3D NULL;
-+
-+	if (!posix_memalign(&p, sysconf(_SC_PAGESIZE), sz))
-+		return p;
-+
-+	return NULL;
-+}
-+
- static int get_value(size_t num_params, struct tee_ioctl_param *params,
- 		     const uint32_t idx, struct param_value **value)
- {
-@@ -336,7 +346,7 @@ static struct tee_shm *register_local_shm(int fd, size=
_t size)
-=20
- 	memset(&data, 0, sizeof(data));
-=20
--	buf =3D malloc(size);
-+	buf =3D paged_aligned_alloc(size);
- 	if (!buf)
- 		return NULL;
-=20
---=20
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0001-co=
re-SPMC-update-for-FF-A-version-1.0.patch b/meta-arm-bsp/recipes-security/o=
ptee/files/optee-os/tc0/0001-core-SPMC-update-for-FF-A-version-1.0.patch
deleted file mode 100644
index d3b2319..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0001-core-SPMC=
-update-for-FF-A-version-1.0.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Upstream-Status: Pending [https://github.com/jenswi-linaro/optee_os/commit=
/7c3b052b871420618a08402f626923fe85a139db]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 7c3b052b871420618a08402f626923fe85a139db Mon Sep 17 00:00:00 2001
-From: Marc Bonnici <marc.bonnici@arm.com>
-Date: Wed, 23 Sep 2020 13:55:22 +0100
-Subject: [PATCH 1/3] core: SPMC: update for FF-A version 1.0
-
-Update expected memory attributes. As per the FF-A spec (5.11.3)  a
-lender of a memory region should not specify the instruction access
-permission, therefore update the expected memory attribute.
-
-Updates the version number to 1.0 replacing the previous version number
-0.9.
----
- core/arch/arm/include/optee_ffa.h  | 4 ++--
- core/arch/arm/kernel/thread_spmc.c | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/core/arch/arm/include/optee_ffa.h b/core/arch/arm/include/opt=
ee_ffa.h
-index 8498fbab..9daca732 100644
---- a/core/arch/arm/include/optee_ffa.h
-+++ b/core/arch/arm/include/optee_ffa.h
-@@ -27,8 +27,8 @@
-  * w3-w7: Implementation defined, free to be used below
-  */
-=20
--#define OPTEE_FFA_VERSION_MAJOR	UINT32_C(0)
--#define OPTEE_FFA_VERSION_MINOR	UINT32_C(9)
-+#define OPTEE_FFA_VERSION_MAJOR	UINT32_C(1)
-+#define OPTEE_FFA_VERSION_MINOR	UINT32_C(0)
-=20
- #define OPTEE_FFA_BLOCKING_CALL(id)	UINT32_C(id)
- #define OPTEE_FFA_YIELDING_CALL_BIT	31
-diff --git a/core/arch/arm/kernel/thread_spmc.c b/core/arch/arm/kernel/thr=
ead_spmc.c
-index 81edf03a..16f3bbe1 100644
---- a/core/arch/arm/kernel/thread_spmc.c
-+++ b/core/arch/arm/kernel/thread_spmc.c
-@@ -433,7 +433,7 @@ static int mem_share_init(void *buf, size_t blen, unsi=
gned int *page_count,
- {
- 	struct mem_region_descr *region_descr =3D NULL;
- 	struct mem_transaction_descr *descr =3D NULL;
--	const uint8_t exp_mem_acc_perm =3D 0x6; /* Not executable, Read-write */
-+	const uint8_t exp_mem_acc_perm =3D 0x2; /* Read-write */
- 	/* Normal memory, Write-Back cacheable, Inner shareable */
- 	const uint8_t exp_mem_reg_attr =3D 0x2f;
- 	unsigned int num_mem_accs =3D 0;
---=20
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0002-co=
re-add-thread_smccc.patch b/meta-arm-bsp/recipes-security/optee/files/optee=
-os/tc0/0002-core-add-thread_smccc.patch
deleted file mode 100644
index 32a420e..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0002-core-add-=
thread_smccc.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-Upstream-Status: Pending [https://github.com/jenswi-linaro/optee_os/commit=
/269e226eea2b2f26a6f844b7d25bc2b2a9b26315]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 269e226eea2b2f26a6f844b7d25bc2b2a9b26315 Mon Sep 17 00:00:00 2001
-From: Jens Wiklander <jens.wiklander@linaro.org>
-Date: Tue, 4 Feb 2020 17:30:55 +0100
-Subject: [PATCH 2/3] core: add thread_smccc()
-
-Adds the assembly function thread_smccc() which loads the first 8
-registers with the argument and executes an SMC or HVC instruction as
-appropriate. The result in the first 8 registers is then saved in the
-argument struct.
-
-Change-Id: Ie14154fb38de5ced3cfdebdb0bf19e48caaf2279
-Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
----
- core/arch/arm/include/kernel/thread.h |  1 +
- core/arch/arm/kernel/thread_a32.S     | 16 ++++++++++++++++
- core/arch/arm/kernel/thread_a64.S     | 15 +++++++++++++++
- 3 files changed, 32 insertions(+)
-
-diff --git a/core/arch/arm/include/kernel/thread.h b/core/arch/arm/include=
/kernel/thread.h
-index b9c0ba4b..4f0520e9 100644
---- a/core/arch/arm/include/kernel/thread.h
-+++ b/core/arch/arm/include/kernel/thread.h
-@@ -704,6 +704,7 @@ uint32_t thread_rpc_cmd(uint32_t cmd, size_t num_param=
s,
-=20
- unsigned long thread_smc(unsigned long func_id, unsigned long a1,
- 			 unsigned long a2, unsigned long a3);
-+void thread_smccc(struct thread_smc_args *arg_res);
-=20
- /**
-  * Allocate data for payload buffers.
-diff --git a/core/arch/arm/kernel/thread_a32.S b/core/arch/arm/kernel/thre=
ad_a32.S
-index 199e90a9..75d85c32 100644
---- a/core/arch/arm/kernel/thread_a32.S
-+++ b/core/arch/arm/kernel/thread_a32.S
-@@ -210,6 +210,22 @@ FUNC thread_smc , :
- 	bx	lr
- END_FUNC thread_smc
-=20
-+/* void thread_smccc(struct thread_smc_args *arg_res) */
-+FUNC thread_smccc , :
-+	push	{r4-r7}
-+	push	{r0, lr}
-+	ldm	r0, {r0-r7}
-+#ifdef CFG_CORE_SEL2_SPMC
-+	hvc	#0
-+#else
-+	smc	#0
-+#endif
-+	pop	{r12, lr}
-+	stm	r12, {r0-r7}
-+	pop	{r4-r7}
-+	bx	lr
-+END_FUNC thread_smccc
-+
- FUNC thread_init_vbar , :
- 	/* Set vector (VBAR) */
- 	write_vbar r0
-diff --git a/core/arch/arm/kernel/thread_a64.S b/core/arch/arm/kernel/thre=
ad_a64.S
-index 9ce31eb2..3e0f5115 100644
---- a/core/arch/arm/kernel/thread_a64.S
-+++ b/core/arch/arm/kernel/thread_a64.S
-@@ -65,6 +65,21 @@ FUNC thread_smc , :
- 	ret
- END_FUNC thread_smc
-=20
-+/* void thread_smccc(struct thread_smc_args *arg_res) */
-+FUNC thread_smccc , :
-+	push	x0, xzr
-+	mov	x8, x0
-+	load_xregs x8, 0, 0, 7
-+#ifdef CFG_CORE_SEL2_SPMC
-+	hvc	#0
-+#else
-+	smc	#0
-+#endif
-+	pop	x8, xzr
-+	store_xregs x8, 0, 0, 7
-+	ret
-+END_FUNC thread_smccc
-+
- FUNC thread_init_vbar , :
- 	msr	vbar_el1, x0
- 	ret
---=20
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0003-co=
re-enable-SPCI-with-SPM-Core-at-S-EL2.patch b/meta-arm-bsp/recipes-security=
/optee/files/optee-os/tc0/0003-core-enable-SPCI-with-SPM-Core-at-S-EL2.patc=
h
deleted file mode 100644
index c3967dc..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0003-core-enab=
le-SPCI-with-SPM-Core-at-S-EL2.patch
+++ /dev/null
@@ -1,623 +0,0 @@
-Upstream-Status: Pending [https://github.com/jenswi-linaro/optee_os/commit=
/80f0ec4ba2af33584e99e917fa165b77028a511f]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 80f0ec4ba2af33584e99e917fa165b77028a511f Mon Sep 17 00:00:00 2001
-From: Marc Bonnici <marc.bonnici@arm.com>
-Date: Fri, 5 Jun 2020 13:47:40 +0100
-Subject: [PATCH 3/3] core: enable SPCI with SPM Core at S-EL2
-
-This is a port of a pre-exisiting patch to support the case where
-the SPM Core is implementation at S-EL2, that is, in a secure hypervisor.
-This configuration is also know as "S-EL2 SPMC" in the FFA specification.
-
-Compile with CFG_CORE_SEL2_SPMC=3Dy
-
-Note that this is an experimental feature, ABIs etc may have
-incompatible changes.
-
-Sqaushed in:
-	core: Update cookie to uint64 in S-EL2 code
-
-	As part of the update to FF-A 1.0 the globally
-	unique handle to identify a shared memory object is now 64
-	bits wide instead of 32. This commit updates the
-	remaining usage of 32 bit values.
-
-	core: Remove page count from S-EL2 code
-
-	The page count field has been dropped from upstream OP-TEE to
-	accommodate using a 64 bit handle in the same size message param struct,
-	therefore update our implementation to support this.
-
-	core: Update remaining FF-A structures to EAC
-
-	Update relinquish data structures and ABI invocations to the FFA
-	EAC spec
----
- core/arch/arm/arm.mk                   |   7 ++
- core/arch/arm/include/kernel/thread.h  |   6 +
- core/arch/arm/include/mm/mobj.h        |   6 +
- core/arch/arm/kernel/thread_spmc.c     | 164 ++++++++++++++++++++++++-
- core/arch/arm/kernel/thread_spmc_a64.S |   3 +-
- core/arch/arm/mm/mobj_ffa.c            | 104 +++++++++++-----
- core/arch/arm/plat-vexpress/conf.mk    |   5 +
- 7 files changed, 260 insertions(+), 35 deletions(-)
-
-diff --git a/core/arch/arm/arm.mk b/core/arch/arm/arm.mk
-index f495f3c9..7c5e8fb0 100644
---- a/core/arch/arm/arm.mk
-+++ b/core/arch/arm/arm.mk
-@@ -97,6 +97,13 @@ endif
- # changes
- ifeq ($(CFG_CORE_SEL1_SPMC),y)
- $(call force,CFG_CORE_FFA,y)
-+$(call force,CFG_CORE_SEL2_SPMC,n)
-+endif
-+# SPMC configuration "S-EL2 SPMC" where SPM Core is implemented at S-EL2,
-+# that is, the hypervisor sandboxing OP-TEE
-+ifeq ($(CFG_CORE_SEL2_SPMC),y)
-+$(call force,CFG_CORE_FFA,y)
-+$(call force,CFG_CORE_SEL1_SPMC,n)
- endif
-=20
- # Unmaps all kernel mode code except the code needed to take exceptions
-diff --git a/core/arch/arm/include/kernel/thread.h b/core/arch/arm/include=
/kernel/thread.h
-index 4f0520e9..95f48589 100644
---- a/core/arch/arm/include/kernel/thread.h
-+++ b/core/arch/arm/include/kernel/thread.h
-@@ -759,6 +759,12 @@ enum thread_shm_cache_user {
- void *thread_rpc_shm_cache_alloc(enum thread_shm_cache_user user,
- 				 enum thread_shm_type shm_type,
- 				 size_t size, struct mobj **mobj);
-+
-+#if defined(CFG_CORE_SEL2_SPMC)
-+struct mobj_ffa *thread_spmc_populate_mobj_from_rx(uint64_t cookie);
-+void thread_spmc_relinquish(uint64_t memory_region_handle);
-+#endif
-+
- #endif /*__ASSEMBLER__*/
-=20
- #endif /*KERNEL_THREAD_H*/
-diff --git a/core/arch/arm/include/mm/mobj.h b/core/arch/arm/include/mm/mo=
bj.h
-index 2b9bd90c..3f820666 100644
---- a/core/arch/arm/include/mm/mobj.h
-+++ b/core/arch/arm/include/mm/mobj.h
-@@ -216,6 +216,12 @@ struct mobj_ffa *mobj_ffa_sel1_spmc_new(unsigned int =
num_pages);
- void mobj_ffa_sel1_spmc_delete(struct mobj_ffa *mobj);
- TEE_Result mobj_ffa_sel1_spmc_reclaim(uint64_t cookie);
- #endif
-+#ifdef CFG_CORE_SEL2_SPMC
-+struct mobj_ffa *mobj_ffa_sel2_spmc_new(uint64_t cookie,
-+                                        unsigned int num_pages);
-+void mobj_ffa_sel2_spmc_delete(struct mobj_ffa *mobj);
-+#endif
-+
- uint64_t mobj_ffa_get_cookie(struct mobj_ffa *mobj);
- TEE_Result mobj_ffa_add_pages_at(struct mobj_ffa *mobj, unsigned int *idx=
,
- 				 paddr_t pa, unsigned int num_pages);
-diff --git a/core/arch/arm/kernel/thread_spmc.c b/core/arch/arm/kernel/thr=
ead_spmc.c
-index 16f3bbe1..3d7dc035 100644
---- a/core/arch/arm/kernel/thread_spmc.c
-+++ b/core/arch/arm/kernel/thread_spmc.c
-@@ -7,6 +7,7 @@
- #include <assert.h>
- #include <ffa.h>
- #include <io.h>
-+#include <initcall.h>
- #include <kernel/interrupt.h>
- #include <kernel/panic.h>
- #include <kernel/spinlock.h>
-@@ -88,6 +89,18 @@ struct mem_frag_state {
-=20
- static uint16_t my_sp_id =3D 0x8001;
-=20
-+
-+/* Table 149: FFA_MEM_RELINQUISH. */
-+struct ffa_relinquish_descriptor {
-+       uint64_t handle;
-+       uint32_t flags;
-+       uint32_t endpoint_count;
-+       uint16_t endpoint_id_array[];
-+};
-+
-+/* Our VM ID is 0x8001, non-secure VM ID 0x0001 */
-+const uint32_t thread_spmc_target_info =3D 0x80010001;
-+
- /*
-  * If @rxtx_size is 0 RX/TX buffers are not mapped or initialized.
-  *
-@@ -101,8 +114,16 @@ static uint16_t my_sp_id =3D 0x8001;
-  * these buffers so we must always be careful when reading. while we hold
-  * the lock.
-  */
-+
-+#ifdef CFG_CORE_SEL2_SPMC
-+static uint8_t rx_buf[SMALL_PAGE_SIZE] __aligned(SMALL_PAGE_SIZE);
-+static uint8_t tx_buf[SMALL_PAGE_SIZE] __aligned(SMALL_PAGE_SIZE);
-+#else
- static void *rx_buf;
- static void *tx_buf;
-+#endif
-+
-+
- static unsigned int rxtx_size;
- static unsigned int rxtx_spinlock;
- static bool tx_buf_is_mine;
-@@ -127,6 +148,28 @@ static void set_args(struct thread_smc_args *args, ui=
nt32_t fid,
- 					  .a5 =3D w5, };
- }
-=20
-+static int __maybe_unused
-+set_pages(struct constituent_address_range *regions, unsigned int num_reg=
ions,
-+	  unsigned int num_pages, struct mobj_ffa *mf)
-+{
-+	unsigned int n =3D 0;
-+	unsigned int idx =3D 0;
-+
-+	for (n =3D 0; n < num_regions; n++) {
-+		unsigned int page_count =3D READ_ONCE(regions[n].page_count);
-+		uint64_t addr =3D READ_ONCE(regions[n].address);
-+
-+		if (mobj_ffa_add_pages_at(mf, &idx, addr, page_count))
-+			return FFA_INVALID_PARAMETERS;
-+	}
-+
-+	if (idx !=3D num_pages)
-+		return FFA_INVALID_PARAMETERS;
-+
-+	return 0;
-+}
-+
-+
- static void handle_version(struct thread_smc_args *args)
- {
- 	/*
-@@ -188,6 +231,7 @@ static void handle_features(struct thread_smc_args *ar=
gs)
- 		 FFA_PARAM_MBZ, FFA_PARAM_MBZ, FFA_PARAM_MBZ);
- }
-=20
-+#ifdef CFG_CORE_SEL1_SPMC
- static int map_buf(paddr_t pa, unsigned int sz, void **va_ret)
- {
- 	tee_mm_entry_t *mm =3D NULL;
-@@ -293,6 +337,7 @@ out:
- 	set_args(args, ret_fid, FFA_PARAM_MBZ, rc,
- 		 FFA_PARAM_MBZ, FFA_PARAM_MBZ, FFA_PARAM_MBZ);
- }
-+#endif
-=20
- static void handle_rx_release(struct thread_smc_args *args)
- {
-@@ -408,6 +453,7 @@ static void handle_blocking_call(struct thread_smc_arg=
s *args)
- 	}
- }
-=20
-+#if CFG_CORE_SEL1_SPMC
- static int get_acc_perms(struct mem_accsess_descr *mem_acc,
- 			 unsigned int num_mem_accs, uint8_t *acc_perms,
- 			 unsigned int *region_offs)
-@@ -531,7 +577,11 @@ static int add_mem_share_frag(struct mem_frag_state *=
s, void *buf, size_t flen)
-=20
- 	SLIST_REMOVE(&frag_state_head, s, mem_frag_state, link);
- 	if (rc < 0)
-+#ifdef CFG_CORE_SEL2_SPMC
-+		mobj_ffa_sel2_spmc_delete(s->share.mf);
-+#else
- 		mobj_ffa_sel1_spmc_delete(s->share.mf);
-+#endif
- 	else
- 		mobj_ffa_push_to_inactive(s->share.mf);
- 	free(s);
-@@ -559,8 +609,8 @@ static int add_mem_share(tee_mm_entry_t *mm, void *buf=
, size_t blen,
- 			 sizeof(struct constituent_address_range), &n) ||
- 	    ADD_OVERFLOW(n, addr_range_offs, &n) || n > blen)
- 		return FFA_INVALID_PARAMETERS;
--
- 	share.mf =3D mobj_ffa_sel1_spmc_new(share.page_count);
-+
- 	if (!share.mf)
- 		return FFA_NO_MEMORY;
-=20
-@@ -601,6 +651,7 @@ static int add_mem_share(tee_mm_entry_t *mm, void *buf=
, size_t blen,
- 	return 0;
- err:
- 	mobj_ffa_sel1_spmc_delete(share.mf);
-+
- 	return rc;
- }
-=20
-@@ -809,6 +860,7 @@ static void handle_mem_reclaim(struct thread_smc_args =
*args)
- out:
- 	set_args(args, ret_fid, ret_val, 0, 0, 0, 0);
- }
-+#endif
-=20
- /* Only called from assembly */
- void thread_spmc_msg_recv(struct thread_smc_args *args);
-@@ -822,6 +874,7 @@ void thread_spmc_msg_recv(struct thread_smc_args *args=
)
- 	case FFA_FEATURES:
- 		handle_features(args);
- 		break;
-+#if CFG_CORE_SEL1_SPMC
- #ifdef ARM64
- 	case FFA_RXTX_MAP_64:
- #endif
-@@ -831,6 +884,7 @@ void thread_spmc_msg_recv(struct thread_smc_args *args=
)
- 	case FFA_RXTX_UNMAP:
- 		handle_rxtx_unmap(args);
- 		break;
-+#endif
- 	case FFA_RX_RELEASE:
- 		handle_rx_release(args);
- 		break;
-@@ -847,6 +901,7 @@ void thread_spmc_msg_recv(struct thread_smc_args *args=
)
- 		else
- 			handle_blocking_call(args);
- 		break;
-+#if CFG_CORE_SEL1_SPMC
- #ifdef ARM64
- 	case FFA_MEM_SHARE_64:
- #endif
-@@ -859,6 +914,7 @@ void thread_spmc_msg_recv(struct thread_smc_args *args=
)
- 	case FFA_MEM_FRAG_TX:
- 		handle_mem_frag_tx(args);
- 		break;
-+#endif
- 	default:
- 		EMSG("Unhandled FFA function ID %#"PRIx32, (uint32_t)args->a0);
- 		set_args(args, FFA_ERROR, FFA_PARAM_MBZ, FFA_NOT_SUPPORTED,
-@@ -1185,3 +1241,109 @@ void thread_rpc_free_global_payload(struct mobj *m=
obj __unused)
-=20
- 	assert(!cant_happen);
- }
-+
-+#ifdef CFG_CORE_SEL2_SPMC
-+static void spmc_rxtx_map(void)
-+{
-+	struct thread_smc_args args =3D {
-+		.a0 =3D FFA_RXTX_MAP_64,
-+		.a1 =3D (vaddr_t)tx_buf,
-+		.a2 =3D (vaddr_t)rx_buf,
-+		.a3 =3D 1,
-+	};
-+
-+	thread_smccc(&args);
-+	if (args.a0 =3D=3D FFA_ERROR) {
-+		EMSG("ERROR rxtx map failed with error %ld\n", args.a2);
-+		panic();
-+	}
-+}
-+
-+static struct mem_transaction_descr *spmc_retrieve_req(uint64_t cookie)
-+{
-+	struct mem_transaction_descr *retrieve_region =3D (void *)tx_buf;
-+
-+	struct thread_smc_args args =3D {
-+		.a0 =3D FFA_MEM_RETRIEVE_REQ_64,
-+		.a1 =3D   sizeof(*retrieve_region),  	// Total Length
-+		.a2 =3D	sizeof(*retrieve_region),	// Frag Length =3D=3D Total length
-+		.a3 =3D	0,				// Address, Using TX -> MBZ
-+		.a4 =3D   0 				// Using TX -> MBZ
-+	};
-+
-+	/* TODO pass all the information required by the spec */
-+	memset(retrieve_region, 0, sizeof(*retrieve_region));
-+	retrieve_region->global_handle =3D cookie;
-+
-+	thread_smccc(&args);
-+	if (args.a0 =3D=3D FFA_ERROR /*TODO !=3D FFA_MEM_RETRIEVE_RESP_64 */) {
-+		EMSG("Failed to fetch cookie %#"PRIx64, cookie);
-+		return NULL;
-+	}
-+
-+	return (void *)rx_buf;
-+}
-+
-+void thread_spmc_relinquish(uint64_t cookie)
-+{
-+	struct ffa_relinquish_descriptor *relinquish_desc =3D (void *)tx_buf;
-+
-+	struct thread_smc_args args =3D {
-+		.a0 =3D FFA_MEM_RELINQUISH,
-+	};
-+
-+	memset(relinquish_desc, 0, sizeof(*relinquish_desc));
-+	relinquish_desc->handle =3D cookie;
-+	relinquish_desc->flags =3D 0;
-+	/* TODO: Add endpoint details. */
-+	thread_smccc(&args);
-+	if (args.a0 !=3D FFA_SUCCESS_32)
-+		EMSG("Failed to relinquish cookie %#"PRIx64, cookie);
-+}
-+
-+struct mobj_ffa *thread_spmc_populate_mobj_from_rx(uint64_t cookie)
-+{
-+	struct mem_transaction_descr *retrieve_desc;
-+	struct mem_region_descr *descr;
-+	struct mobj_ffa *mf;
-+	uint32_t num_pages;
-+
-+
-+	/* XXX Support single mem_region. */
-+	retrieve_desc =3D spmc_retrieve_req(cookie);
-+
-+	if (!retrieve_desc) {
-+	    EMSG("Failed to retrieve cookie from rx buffer %#"PRIx64, cookie);
-+	    return NULL;
-+	}
-+
-+	descr =3D (struct mem_region_descr *)
-+			((uint8_t *)retrieve_desc +
-+				retrieve_desc->mem_accsess_descr_array[0].mem_region_offs);
-+
-+	num_pages =3D descr->total_page_count;
-+	mf =3D mobj_ffa_sel2_spmc_new(cookie, num_pages);
-+
-+	if (!mf)
-+		return NULL;
-+
-+	if (set_pages(descr->address_range_array,
-+				  descr->address_range_count,
-+				  num_pages, mf)) {
-+		mobj_ffa_sel2_spmc_delete(mf);
-+		return NULL;
-+
-+	}
-+
-+	return mf;
-+}
-+
-+static TEE_Result spmc_init(void)
-+{
-+	spmc_rxtx_map();
-+
-+	return TEE_SUCCESS;
-+}
-+service_init(spmc_init);
-+
-+#endif /*CFG_CORE_SEL2_SPMC*/
-diff --git a/core/arch/arm/kernel/thread_spmc_a64.S b/core/arch/arm/kernel=
/thread_spmc_a64.S
-index 3d57da4d..66f9d0b4 100644
---- a/core/arch/arm/kernel/thread_spmc_a64.S
-+++ b/core/arch/arm/kernel/thread_spmc_a64.S
-@@ -17,7 +17,8 @@
-=20
- FUNC thread_ffa_msg_wait , :
- 	mov_imm	x0, FFA_MSG_WAIT		/* FID */
--	mov	x1, #FFA_TARGET_INFO_MBZ	/* Target info MBZ */
-+	adr     x1, thread_spmc_target_info
-+	ldr     w1, [x1]
- 	mov	x2, #FFA_PARAM_MBZ		/* Param MBZ */
- 	mov	x3, #FFA_PARAM_MBZ		/* Param MBZ */
- 	mov	x4, #FFA_PARAM_MBZ		/* Param MBZ */
-diff --git a/core/arch/arm/mm/mobj_ffa.c b/core/arch/arm/mm/mobj_ffa.c
-index fd5e66ea..e2c585a2 100644
---- a/core/arch/arm/mm/mobj_ffa.c
-+++ b/core/arch/arm/mm/mobj_ffa.c
-@@ -19,8 +19,10 @@ struct mobj_ffa {
- 	tee_mm_entry_t *mm;
- 	struct refcount mapcount;
- 	uint16_t page_offset;
-+#ifdef CFG_CORE_SEL1_SPMC
- 	bool registered_by_cookie;
- 	bool unregistered_by_cookie;
-+#endif
- 	paddr_t pages[];
- };
-=20
-@@ -186,6 +188,24 @@ void mobj_ffa_sel1_spmc_delete(struct mobj_ffa *mf)
- }
- #endif /*CFG_CORE_SEL1_SPMC*/
-=20
-+#ifdef CFG_CORE_SEL2_SPMC
-+struct mobj_ffa *mobj_ffa_sel2_spmc_new(uint64_t cookie,
-+					unsigned int num_pages)
-+{
-+	struct mobj_ffa *mf =3D NULL;
-+
-+	mf =3D ffa_new(num_pages);
-+	if (mf)
-+		mf->cookie =3D cookie;
-+	return mf;
-+}
-+
-+void mobj_ffa_sel2_spmc_delete(struct mobj_ffa *mf)
-+{
-+	free(mf);
-+}
-+#endif /*CFG_CORE_SEL2_SPMC*/
-+
- TEE_Result mobj_ffa_add_pages_at(struct mobj_ffa *mf, unsigned int *idx,
- 				 paddr_t pa, unsigned int num_pages)
- {
-@@ -234,7 +254,9 @@ static void unmap_helper(struct mobj_ffa *mf)
- 	}
- }
-=20
--TEE_Result mobj_ffa_unregister_by_cookie(uint64_t cookie)
-+
-+#ifdef CFG_CORE_SEL1_SPMC
-+TEE_Result mobj_ffa_sel1_spmc_reclaim(uint64_t cookie)
- {
- 	TEE_Result res =3D TEE_SUCCESS;
- 	struct mobj_ffa *mf =3D NULL;
-@@ -244,7 +266,7 @@ TEE_Result mobj_ffa_unregister_by_cookie(uint64_t cook=
ie)
- 	mf =3D find_in_list(&shm_head, cmp_cookie, cookie);
- 	/*
- 	 * If the mobj is found here it's still active and cannot be
--	 * unregistered.
-+	 * reclaimed.
- 	 */
- 	if (mf) {
- 		DMSG("cookie %#"PRIx64" busy refc %u",
-@@ -252,24 +274,34 @@ TEE_Result mobj_ffa_unregister_by_cookie(uint64_t co=
okie)
- 		res =3D TEE_ERROR_BUSY;
- 		goto out;
- 	}
-+
- 	mf =3D find_in_list(&shm_inactive_head, cmp_cookie, cookie);
-+	if (!mf) {
-+		res =3D TEE_ERROR_ITEM_NOT_FOUND;
-+		goto out;
-+	}
- 	/*
--	 * If the mobj isn't found or if it already has been unregistered.
-+	 * If the mobj has been registered via mobj_ffa_get_by_cookie()
-+	 * but not unregistered yet with mobj_ffa_unregister_by_cookie().
- 	 */
--	if (!mf || mf->unregistered_by_cookie) {
--		res =3D TEE_ERROR_ITEM_NOT_FOUND;
-+	if (mf->registered_by_cookie && !mf->unregistered_by_cookie) {
-+		DMSG("cookie %#"PRIx64" busy", cookie);
-+		res =3D TEE_ERROR_BUSY;
- 		goto out;
- 	}
--	mf->unregistered_by_cookie =3D true;
--	res =3D TEE_SUCCESS;
-=20
-+	if (!pop_from_list(&shm_inactive_head, cmp_ptr, (vaddr_t)mf))
-+		panic();
-+	res =3D TEE_SUCCESS;
- out:
- 	cpu_spin_unlock_xrestore(&shm_lock, exceptions);
-+	if (!res)
-+		mobj_ffa_sel1_spmc_delete(mf);
- 	return res;
- }
-+#endif /*CFG_CORE_SEL1_SPMC*/
-=20
--#ifdef CFG_CORE_SEL1_SPMC
--TEE_Result mobj_ffa_sel1_spmc_reclaim(uint64_t cookie)
-+TEE_Result mobj_ffa_unregister_by_cookie(uint64_t cookie)
- {
- 	TEE_Result res =3D TEE_SUCCESS;
- 	struct mobj_ffa *mf =3D NULL;
-@@ -279,7 +311,7 @@ TEE_Result mobj_ffa_sel1_spmc_reclaim(uint64_t cookie)
- 	mf =3D find_in_list(&shm_head, cmp_cookie, cookie);
- 	/*
- 	 * If the mobj is found here it's still active and cannot be
--	 * reclaimed.
-+	 * unregistered.
- 	 */
- 	if (mf) {
- 		DMSG("cookie %#"PRIx64" busy refc %u",
-@@ -287,43 +319,42 @@ TEE_Result mobj_ffa_sel1_spmc_reclaim(uint64_t cooki=
e)
- 		res =3D TEE_ERROR_BUSY;
- 		goto out;
- 	}
--
- 	mf =3D find_in_list(&shm_inactive_head, cmp_cookie, cookie);
--	if (!mf) {
--		res =3D TEE_ERROR_ITEM_NOT_FOUND;
--		goto out;
--	}
- 	/*
--	 * If the mobj has been registered via mobj_ffa_get_by_cookie()
--	 * but not unregistered yet with mobj_ffa_unregister_by_cookie().
-+	 * If the mobj isn't found or if it already has been unregistered.
- 	 */
--	if (mf->registered_by_cookie && !mf->unregistered_by_cookie) {
--		DMSG("cookie %#"PRIx64" busy", cookie);
--		res =3D TEE_ERROR_BUSY;
-+#ifdef CFG_CORE_SEL2_SPMC
-+	if (!mf) {
-+#else
-+	if (!mf || mf->unregistered_by_cookie) {
-+#endif
-+		res =3D TEE_ERROR_ITEM_NOT_FOUND;
- 		goto out;
- 	}
-=20
--	if (!pop_from_list(&shm_inactive_head, cmp_ptr, (vaddr_t)mf))
--		panic();
-+
-+#ifdef CFG_CORE_SEL2_SPMC
-+	mf =3D pop_from_list(&shm_inactive_head, cmp_cookie, cookie);
-+	mobj_ffa_sel2_spmc_delete(mf);
-+	thread_spmc_relinquish(cookie);
-+#else
-+	mf->unregistered_by_cookie =3D true;
-+#endif
- 	res =3D TEE_SUCCESS;
-+
- out:
- 	cpu_spin_unlock_xrestore(&shm_lock, exceptions);
--	if (!res)
--		mobj_ffa_sel1_spmc_delete(mf);
- 	return res;
- }
--#endif /*CFG_CORE_SEL1_SPMC*/
-=20
--struct mobj *mobj_ffa_get_by_cookie(uint64_t cookie, unsigned int interna=
l_offs)
-+struct mobj *mobj_ffa_get_by_cookie(uint64_t cookie,
-+				    unsigned int internal_offs)
- {
- 	struct mobj_ffa *mf =3D NULL;
- 	uint32_t exceptions =3D 0;
--
- 	if (internal_offs >=3D SMALL_PAGE_SIZE)
- 		return NULL;
--
- 	exceptions =3D cpu_spin_lock_xsave(&shm_lock);
--
- 	mf =3D find_in_list(&shm_head, cmp_cookie, cookie);
- 	if (mf) {
- 		if (mf->page_offset =3D=3D internal_offs) {
-@@ -345,9 +376,19 @@ struct mobj *mobj_ffa_get_by_cookie(uint64_t cookie, =
unsigned int internal_offs)
- 		}
- 	} else {
- 		mf =3D pop_from_list(&shm_inactive_head, cmp_cookie, cookie);
-+#if defined(CFG_CORE_SEL2_SPMC)
-+		/* Try to retrieve it from the SPM at S-EL2 */
-+		if (mf)
-+			DMSG("cookie %#"PRIx64" resurrecting", cookie);
-+		if (!mf)
-+			EMSG("Populating mobj from rx buffer\n");
-+			mf =3D thread_spmc_populate_mobj_from_rx(cookie);
-+#endif
- 		if (mf) {
-+#if defined(CFG_CORE_SEL1_SPMC)
- 			mf->unregistered_by_cookie =3D false;
- 			mf->registered_by_cookie =3D true;
-+#endif
- 			assert(refcount_val(&mf->mobj.refc) =3D=3D 0);
- 			refcount_set(&mf->mobj.refc, 1);
- 			refcount_set(&mf->mapcount, 0);
-@@ -358,15 +399,12 @@ struct mobj *mobj_ffa_get_by_cookie(uint64_t cookie,=
 unsigned int internal_offs)
- 			SLIST_INSERT_HEAD(&shm_head, mf, link);
- 		}
- 	}
--
- 	cpu_spin_unlock_xrestore(&shm_lock, exceptions);
--
- 	if (!mf) {
- 		EMSG("Failed to get cookie %#"PRIx64" internal_offs %#x",
--		     cookie, internal_offs);
-+			cookie, internal_offs);
- 		return NULL;
- 	}
--
- 	return &mf->mobj;
- }
-=20
-diff --git a/core/arch/arm/plat-vexpress/conf.mk b/core/arch/arm/plat-vexp=
ress/conf.mk
-index 26b9f51e..dd6530a6 100644
---- a/core/arch/arm/plat-vexpress/conf.mk
-+++ b/core/arch/arm/plat-vexpress/conf.mk
-@@ -58,8 +58,13 @@ CFG_WITH_STATS ?=3D y
-=20
- ifeq ($(PLATFORM_FLAVOR),fvp)
- CFG_TEE_CORE_NB_CORE =3D 8
-+ifeq ($(CFG_CORE_SEL2_SPMC),y)
-+CFG_TZDRAM_START ?=3D 0x06280000
-+CFG_TZDRAM_SIZE  ?=3D 0x01D80000
-+else
- CFG_TZDRAM_START ?=3D 0x06000000
- CFG_TZDRAM_SIZE  ?=3D 0x02000000
-+endif
- CFG_SHMEM_START  ?=3D 0x83000000
- CFG_SHMEM_SIZE   ?=3D 0x00200000
- # DRAM1 is defined above 4G
---=20
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0004-co=
re-fixes-to-align-with-upstream-hafnium.patch b/meta-arm-bsp/recipes-securi=
ty/optee/files/optee-os/tc0/0004-core-fixes-to-align-with-upstream-hafnium.=
patch
deleted file mode 100644
index a36a510..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0004-core-fixe=
s-to-align-with-upstream-hafnium.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 5ca96d9ff7fa5481282fb8f59a54d3cc91a1ae36 Mon Sep 17 00:00:00 2001
-From: Olivier Deprez <olivier.deprez@arm.com>
-Date: Thu, 1 Oct 2020 07:59:54 +0200
-Subject: [PATCH 1/5] core: fixes to align with upstream hafnium
-
-FF-A: fix call to thread_spmc_populate_mobj_from_rx
-
-FF-A: fix typos in thread_spmc.c
-
-FF-A: fix mem retrieve request
-
-FF-A. fix mem relinquish
-
-FF-A: call rx release from thread_spmc_populate_mobj_from_rx
-
-Change-Id: I38794b34bf17428d62218e30bdd0180f75498ed4
-Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- core/arch/arm/kernel/thread_spmc.c | 52 +++++++++++++++++++++---------
- core/arch/arm/mm/mobj_ffa.c        |  3 +-
- 2 files changed, 39 insertions(+), 16 deletions(-)
-
-diff --git a/core/arch/arm/kernel/thread_spmc.c b/core/arch/arm/kernel/thr=
ead_spmc.c
-index 3d7dc035..872221d6 100644
---- a/core/arch/arm/kernel/thread_spmc.c
-+++ b/core/arch/arm/kernel/thread_spmc.c
-@@ -48,7 +48,7 @@ struct mem_access_perm_descr {
- };
-=20
- /* Table 41: Endpoint memory access descriptor */
--struct mem_accsess_descr {
-+struct mem_access_descr {
- 	struct mem_access_perm_descr mem_access_perm_descr;
- 	uint32_t mem_region_offs;
- 	uint64_t reserved;
-@@ -64,7 +64,7 @@ struct mem_transaction_descr {
- 	uint64_t tag;
- 	uint32_t reserved1;
- 	uint32_t mem_access_descr_count;
--	struct mem_accsess_descr mem_accsess_descr_array[];
-+	struct mem_access_descr mem_access_descr_array[];
- };
-=20
- struct ffa_partition_info {
-@@ -453,8 +453,8 @@ static void handle_blocking_call(struct thread_smc_arg=
s *args)
- 	}
- }
-=20
--#if CFG_CORE_SEL1_SPMC
--static int get_acc_perms(struct mem_accsess_descr *mem_acc,
-+#ifdef CFG_CORE_SEL1_SPMC
-+static int get_acc_perms(struct mem_access_descr *mem_acc,
- 			 unsigned int num_mem_accs, uint8_t *acc_perms,
- 			 unsigned int *region_offs)
- {
-@@ -495,7 +495,7 @@ static int mem_share_init(void *buf, size_t blen, unsi=
gned int *page_count,
-=20
- 	/* Check that the endpoint memory access descriptor array fits */
- 	num_mem_accs =3D READ_ONCE(descr->mem_access_descr_count);
--	if (MUL_OVERFLOW(sizeof(struct mem_accsess_descr), num_mem_accs, &n) ||
-+	if (MUL_OVERFLOW(sizeof(struct mem_access_descr), num_mem_accs, &n) ||
- 	    ADD_OVERFLOW(sizeof(*descr), n, &n) || n > blen)
- 		return FFA_INVALID_PARAMETERS;
-=20
-@@ -503,7 +503,7 @@ static int mem_share_init(void *buf, size_t blen, unsi=
gned int *page_count,
- 		return FFA_INVALID_PARAMETERS;
-=20
- 	/* Check that the access permissions matches what's expected */
--	if (get_acc_perms(descr->mem_accsess_descr_array,
-+	if (get_acc_perms(descr->mem_access_descr_array,
- 			  num_mem_accs, &mem_acc_perm, &region_descr_offs) ||
- 	    mem_acc_perm !=3D exp_mem_acc_perm)
- 		return FFA_INVALID_PARAMETERS;
-@@ -1263,17 +1263,29 @@ static struct mem_transaction_descr *spmc_retrieve=
_req(uint64_t cookie)
- {
- 	struct mem_transaction_descr *retrieve_region =3D (void *)tx_buf;
-=20
-+	uint64_t size =3D sizeof(*retrieve_region) +
-+		1 * sizeof(struct mem_access_descr);
- 	struct thread_smc_args args =3D {
- 		.a0 =3D FFA_MEM_RETRIEVE_REQ_64,
--		.a1 =3D   sizeof(*retrieve_region),  	// Total Length
--		.a2 =3D	sizeof(*retrieve_region),	// Frag Length =3D=3D Total length
-+		.a1 =3D   size,  	// Total Length
-+		.a2 =3D	size,	// Frag Length =3D=3D Total length
- 		.a3 =3D	0,				// Address, Using TX -> MBZ
- 		.a4 =3D   0 				// Using TX -> MBZ
- 	};
-=20
- 	/* TODO pass all the information required by the spec */
--	memset(retrieve_region, 0, sizeof(*retrieve_region));
-+	memset(retrieve_region, 0, size);
- 	retrieve_region->global_handle =3D cookie;
-+	retrieve_region->flags =3D 1;
-+	retrieve_region->mem_access_descr_count =3D 1;
-+	retrieve_region->mem_access_descr_array[0].mem_region_offs =3D 0;
-+	retrieve_region->mem_access_descr_array[0].reserved =3D 0;
-+	retrieve_region->mem_access_descr_array[0].mem_access_perm_descr =3D
-+		(struct mem_access_perm_descr) {
-+			.endpoint_id =3D my_sp_id,
-+			.access_perm =3D 0,
-+			.flags =3D 0
-+		};
-=20
- 	thread_smccc(&args);
- 	if (args.a0 =3D=3D FFA_ERROR /*TODO !=3D FFA_MEM_RETRIEVE_RESP_64 */) {
-@@ -1296,6 +1308,8 @@ void thread_spmc_relinquish(uint64_t cookie)
- 	relinquish_desc->handle =3D cookie;
- 	relinquish_desc->flags =3D 0;
- 	/* TODO: Add endpoint details. */
-+	relinquish_desc->endpoint_count =3D 1;
-+	relinquish_desc->endpoint_id_array[0] =3D my_sp_id;
- 	thread_smccc(&args);
- 	if (args.a0 !=3D FFA_SUCCESS_32)
- 		EMSG("Failed to relinquish cookie %#"PRIx64, cookie);
-@@ -1303,11 +1317,14 @@ void thread_spmc_relinquish(uint64_t cookie)
-=20
- struct mobj_ffa *thread_spmc_populate_mobj_from_rx(uint64_t cookie)
- {
-+	struct mobj_ffa *ret =3D NULL;
- 	struct mem_transaction_descr *retrieve_desc;
- 	struct mem_region_descr *descr;
- 	struct mobj_ffa *mf;
- 	uint32_t num_pages;
--
-+	struct thread_smc_args ffa_rx_release_args =3D {
-+		.a0 =3D FFA_RX_RELEASE
-+	};
-=20
- 	/* XXX Support single mem_region. */
- 	retrieve_desc =3D spmc_retrieve_req(cookie);
-@@ -1319,23 +1336,28 @@ struct mobj_ffa *thread_spmc_populate_mobj_from_rx=
(uint64_t cookie)
-=20
- 	descr =3D (struct mem_region_descr *)
- 			((uint8_t *)retrieve_desc +
--				retrieve_desc->mem_accsess_descr_array[0].mem_region_offs);
-+				retrieve_desc->mem_access_descr_array[0].mem_region_offs);
-=20
- 	num_pages =3D descr->total_page_count;
- 	mf =3D mobj_ffa_sel2_spmc_new(cookie, num_pages);
-=20
- 	if (!mf)
--		return NULL;
-+		goto out;
-=20
- 	if (set_pages(descr->address_range_array,
- 				  descr->address_range_count,
- 				  num_pages, mf)) {
- 		mobj_ffa_sel2_spmc_delete(mf);
--		return NULL;
--
-+		goto out;
- 	}
-=20
--	return mf;
-+	ret =3D mf;
-+
-+out:
-+	/* Release RX buffer after the mem retrieve request. */
-+	thread_smccc(&ffa_rx_release_args);
-+
-+	return ret;
- }
-=20
- static TEE_Result spmc_init(void)
-diff --git a/core/arch/arm/mm/mobj_ffa.c b/core/arch/arm/mm/mobj_ffa.c
-index e2c585a2..8e334f04 100644
---- a/core/arch/arm/mm/mobj_ffa.c
-+++ b/core/arch/arm/mm/mobj_ffa.c
-@@ -380,9 +380,10 @@ struct mobj *mobj_ffa_get_by_cookie(uint64_t cookie,
- 		/* Try to retrieve it from the SPM at S-EL2 */
- 		if (mf)
- 			DMSG("cookie %#"PRIx64" resurrecting", cookie);
--		if (!mf)
-+		if (!mf) {
- 			EMSG("Populating mobj from rx buffer\n");
- 			mf =3D thread_spmc_populate_mobj_from_rx(cookie);
-+		}
- #endif
- 		if (mf) {
- #if defined(CFG_CORE_SEL1_SPMC)
---=20
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0005-co=
re-arm-Total-Compute-platform-support.patch b/meta-arm-bsp/recipes-security=
/optee/files/optee-os/tc0/0005-core-arm-Total-Compute-platform-support.patc=
h
deleted file mode 100644
index 52270ec..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0005-core-arm-=
Total-Compute-platform-support.patch
+++ /dev/null
@@ -1,187 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 0c427d7f164a46862f6267b616d4ade28865b57a Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Wed, 15 Jul 2020 12:51:04 +0100
-Subject: [PATCH 2/5] core: arm: Total Compute platform support
-
-Initial support for Total Compute platform[1]
-    - defines tc0 platform configuration
-    - enables CFG_ARM64_core by default
-    - defines TZCDRAM_BASE
-
-Link: [1] https://community.arm.com/developer/tools-software/oss-platforms=
/w/docs/606/total-compute
-
-Change-Id: Icddafbdfac40bb6ff3c367910acf632688343721
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- core/arch/arm/plat-totalcompute/conf.mk       | 32 +++++++++++
- core/arch/arm/plat-totalcompute/main.c        | 55 +++++++++++++++++++
- .../arm/plat-totalcompute/platform_config.h   | 43 +++++++++++++++
- core/arch/arm/plat-totalcompute/sub.mk        |  2 +
- 4 files changed, 132 insertions(+)
- create mode 100644 core/arch/arm/plat-totalcompute/conf.mk
- create mode 100644 core/arch/arm/plat-totalcompute/main.c
- create mode 100644 core/arch/arm/plat-totalcompute/platform_config.h
- create mode 100644 core/arch/arm/plat-totalcompute/sub.mk
-
-diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/plat-=
totalcompute/conf.mk
-new file mode 100644
-index 00000000..4fe894c7
---- /dev/null
-+++ b/core/arch/arm/plat-totalcompute/conf.mk
-@@ -0,0 +1,32 @@
-+PLATFORM_FLAVOR ?=3D tc0
-+
-+ifeq ($(PLATFORM_FLAVOR),tc0)
-+include core/arch/arm/cpu/cortex-armv8-0.mk
-+platform-debugger-arm :=3D 1
-+endif
-+
-+$(call force,CFG_WITH_ARM_TRUSTED_FW,y)
-+$(call force,CFG_GENERIC_BOOT,y)
-+$(call force,CFG_GIC,y)
-+$(call force,CFG_ARM_GICV3,y)
-+$(call force,CFG_PL011,y)
-+$(call force,CFG_PM_STUBS,y)
-+$(call force,CFG_SECURE_TIME_SOURCE_CNTPCT,y)
-+$(call force,CFG_ARM64_core,y)
-+$(call force,CFG_WITH_LPAE,y)
-+
-+ifeq ($(platform-debugger-arm),1)
-+# ARM debugger needs this
-+platform-cflags-debug-info =3D -gdwarf-2
-+platform-aflags-debug-info =3D -gdwarf-2
-+endif
-+
-+ifeq ($(PLATFORM_FLAVOR),tc0)
-+CFG_TEE_CORE_NB_CORE =3D 4
-+
-+CFG_TZDRAM_START ?=3D 0xff000000
-+CFG_TZDRAM_SIZE  ?=3D 0x01000000
-+
-+CFG_SHMEM_START  ?=3D 0xfce00000
-+CFG_SHMEM_SIZE   ?=3D 0x00200000
-+endif
-diff --git a/core/arch/arm/plat-totalcompute/main.c b/core/arch/arm/plat-t=
otalcompute/main.c
-new file mode 100644
-index 00000000..e775abfc
---- /dev/null
-+++ b/core/arch/arm/plat-totalcompute/main.c
-@@ -0,0 +1,55 @@
-+/*
-+ * Copyright (c) 2020, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include <arm.h>
-+#include <console.h>
-+#include <drivers/gic.h>
-+#include <drivers/pl011.h>
-+#include <initcall.h>
-+#include <kernel/boot.h>
-+#include <kernel/interrupt.h>
-+#include <kernel/misc.h>
-+#include <kernel/panic.h>
-+
-+#include <mm/core_mmu.h>
-+#include <platform_config.h>
-+
-+static struct gic_data gic_data __nex_bss;
-+static struct pl011_data console_data __nex_bss;
-+
-+register_phys_mem_pgdir(MEM_AREA_IO_SEC, CONSOLE_UART_BASE, PL011_REG_SIZ=
E);
-+register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICD_BASE, GIC_DIST_REG_SIZE);
-+
-+register_ddr(DRAM0_BASE, DRAM0_SIZE);
-+
-+void main_init_gic(void)
-+{
-+	vaddr_t gicc_base;
-+
-+	gicc_base =3D (vaddr_t)phys_to_virt(GIC_BASE + GICC_OFFSET,
-+					  MEM_AREA_IO_SEC);
-+	if (!gicc_base)
-+		panic();
-+
-+	/*
-+	 * On ARMv8, GIC configuration is initialized in ARM-TF
-+	 * gicd base address is same as gicc_base.
-+	 */
-+	gic_init_base_addr(&gic_data, gicc_base, gicc_base);
-+	itr_init(&gic_data.chip);
-+}
-+
-+void itr_core_handler(void)
-+{
-+	gic_it_handle(&gic_data);
-+}
-+
-+void console_init(void)
-+{
-+	pl011_init(&console_data, CONSOLE_UART_BASE, CONSOLE_UART_CLK_IN_HZ,
-+		   CONSOLE_UART_BAUDRATE);
-+	register_serial_console(&console_data.chip);
-+}
-diff --git a/core/arch/arm/plat-totalcompute/platform_config.h b/core/arch=
/arm/plat-totalcompute/platform_config.h
-new file mode 100644
-index 00000000..dfc58857
---- /dev/null
-+++ b/core/arch/arm/plat-totalcompute/platform_config.h
-@@ -0,0 +1,43 @@
-+/*
-+ * Copyright (c) 2020, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PLATFORM_CONFIG_H
-+#define PLATFORM_CONFIG_H
-+
-+#include <mm/generic_ram_layout.h>
-+
-+/* Make stacks aligned to data cache line length */
-+#define STACK_ALIGNMENT		64
-+
-+#if defined(PLATFORM_FLAVOR_tc0)
-+#define GIC_BASE		0x30000000
-+#define GICD_OFFSET		0x0
-+#define GICC_OFFSET		0x0
-+
-+#define UART0_BASE		0x7FF70000
-+#define UART1_BASE		0x7FF80000
-+
-+#define CONSOLE_UART_BASE	UART0_BASE
-+
-+#define DRAM0_BASE		0x80000000
-+#define DRAM0_SIZE		0x7d000000
-+
-+#define TZCDRAM_BASE		0xff000000
-+#define TZCDRAM_SIZE		0x01000000
-+
-+#else
-+#error "Unknown platform flavor"
-+#endif
-+
-+#ifdef GIC_BASE
-+#define GICD_BASE		(GIC_BASE + GICD_OFFSET)
-+#define GICC_BASE		(GIC_BASE + GICC_OFFSET)
-+#endif
-+
-+#define CONSOLE_UART_BAUDRATE	115200
-+#define CONSOLE_UART_CLK_IN_HZ	7372800
-+
-+#endif /* PLATFORM_CONFIG_H */
-diff --git a/core/arch/arm/plat-totalcompute/sub.mk b/core/arch/arm/plat-t=
otalcompute/sub.mk
-new file mode 100644
-index 00000000..8ddc2fd4
---- /dev/null
-+++ b/core/arch/arm/plat-totalcompute/sub.mk
-@@ -0,0 +1,2 @@
-+global-incdirs-y +=3D .
-+srcs-y +=3D main.c
---=20
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0006-pl=
at-totalcompute-Add-support-for-S-EL2-SPMC.patch b/meta-arm-bsp/recipes-sec=
urity/optee/files/optee-os/tc0/0006-plat-totalcompute-Add-support-for-S-EL2=
-SPMC.patch
deleted file mode 100644
index 3070d5f..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0006-plat-tota=
lcompute-Add-support-for-S-EL2-SPMC.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 8c21a8c7ac92839f36f83ebff9a208f24302c780 Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Mon, 16 Nov 2020 17:29:09 +0000
-Subject: [PATCH 3/5] plat-totalcompute: Add support for S-EL2 SPMC
-
-This patch adds CFG_CORE_SEL2_SPMC support. Defines CFG_TZDRAM_START
-address with memory region reserved for SPMC. Adds secondary cpu boot
-request handler.
-
-Change-Id: I3f274c7bb6b7df2706ea81aee0f2a8f8f39c1d80
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- core/arch/arm/plat-totalcompute/conf.mk       |  5 ++
- core/arch/arm/plat-totalcompute/sub.mk        |  3 ++
- core/arch/arm/plat-totalcompute/tc0_spmc_pm.c | 50 +++++++++++++++++++
- 3 files changed, 58 insertions(+)
- create mode 100644 core/arch/arm/plat-totalcompute/tc0_spmc_pm.c
-
-diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/plat-=
totalcompute/conf.mk
-index 4fe894c7..34095acf 100644
---- a/core/arch/arm/plat-totalcompute/conf.mk
-+++ b/core/arch/arm/plat-totalcompute/conf.mk
-@@ -24,8 +24,13 @@ endif
- ifeq ($(PLATFORM_FLAVOR),tc0)
- CFG_TEE_CORE_NB_CORE =3D 4
-=20
-+ifeq ($(CFG_CORE_SEL2_SPMC),y)
-+CFG_TZDRAM_START ?=3D 0xfd281000
-+CFG_TZDRAM_SIZE  ?=3D 0x01d7f000
-+else
- CFG_TZDRAM_START ?=3D 0xff000000
- CFG_TZDRAM_SIZE  ?=3D 0x01000000
-+endif
-=20
- CFG_SHMEM_START  ?=3D 0xfce00000
- CFG_SHMEM_SIZE   ?=3D 0x00200000
-diff --git a/core/arch/arm/plat-totalcompute/sub.mk b/core/arch/arm/plat-t=
otalcompute/sub.mk
-index 8ddc2fd4..ffd76ee9 100644
---- a/core/arch/arm/plat-totalcompute/sub.mk
-+++ b/core/arch/arm/plat-totalcompute/sub.mk
-@@ -1,2 +1,5 @@
- global-incdirs-y +=3D .
- srcs-y +=3D main.c
-+ifeq ($(CFG_CORE_FFA),y)
-+srcs-y +=3D tc0_spmc_pm.c
-+endif
-diff --git a/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c b/core/arch/arm=
/plat-totalcompute/tc0_spmc_pm.c
-new file mode 100644
-index 00000000..8e59a8cc
---- /dev/null
-+++ b/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c
-@@ -0,0 +1,50 @@
-+// SPDX-License-Identifier: BSD-2-Clause
-+/*
-+ * Copyright (c) 2020, Arm Limited
-+ */
-+
-+#include <arm.h>
-+#include <kernel/boot.h>
-+#include <ffa.h>
-+#include <sm/psci.h>
-+
-+/*
-+ * Lookup table of core and cluster affinities on the TC0. In the absence=
 of a
-+ * DT that provides the same information, this table is used to initialis=
e
-+ * OP-TEE on secondary cores.
-+ */
-+static const uint64_t core_clus_aff_array[] =3D {
-+	0x0000,		/* Cluster 0 Cpu 0 */
-+	0x0001,		/* Cluster 0 Cpu 1 */
-+	0x0002,		/* Cluster 0 Cpu 2 */
-+	0x0003		/* Cluster 0 Cpu 3 */
-+};
-+
-+void ffa_secondary_cpu_boot_req(vaddr_t secondary_ep, uint64_t cookie)
-+{
-+	unsigned long mpidr =3D read_mpidr();
-+	unsigned int aff_shift =3D 0;
-+	unsigned long a1 =3D 0;
-+	unsigned int cnt =3D 0;
-+	int32_t ret =3D 0;
-+
-+	if (mpidr & MPIDR_MT_MASK)
-+		aff_shift =3D MPIDR_CLUSTER_SHIFT;
-+
-+	for (cnt =3D 0; cnt < ARRAY_SIZE(core_clus_aff_array); cnt++) {
-+		/* Clear out the affinity fields until level 2 */
-+		a1 =3D mpidr & ~(unsigned long)MPIDR_AARCH32_AFF_MASK;
-+
-+		/* Create an mpidr from core_clus_aff_array */
-+		a1 |=3D core_clus_aff_array[cnt] << aff_shift;
-+
-+		/* Invoke the PSCI_CPU_ON_SMC64 function */
-+		ret =3D thread_smc(PSCI_CPU_ON_SMC64, a1, secondary_ep, cookie);
-+
-+		if (ret !=3D PSCI_RET_SUCCESS)
-+			EMSG("PSCI_CPU_ON op on mpidr 0x%lx failed %"PRId32,
-+			     a1, ret);
-+		else
-+			DMSG("PSCI_CPU_ON op on mpidr 0x%lx done", a1);
-+	}
-+}
---=20
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0007-pl=
at-totalcompute-add-optee-manifest-file-and-sp-lay.patch b/meta-arm-bsp/rec=
ipes-security/optee/files/optee-os/tc0/0007-plat-totalcompute-add-optee-man=
ifest-file-and-sp-lay.patch
deleted file mode 100644
index 6535496..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0007-plat-tota=
lcompute-add-optee-manifest-file-and-sp-lay.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 582bf63102ec37dadff2147dcebcb62783dcf377 Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Mon, 16 Nov 2020 18:03:21 +0000
-Subject: [PATCH 4/5] plat-totalcompute: add optee manifest file and sp lay=
out
-
-For S-EL2 SPMC, add optee manifest file and sp layout file
-
-Change-Id: Ic3179987decf4e017cd4a0ad91b3beeea2bd6ca1
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- .../arm/plat-totalcompute/optee_manifest.dts  | 33 +++++++++++++++++++
- .../arch/arm/plat-totalcompute/sp_layout.json |  6 ++++
- 2 files changed, 39 insertions(+)
- create mode 100644 core/arch/arm/plat-totalcompute/optee_manifest.dts
- create mode 100644 core/arch/arm/plat-totalcompute/sp_layout.json
-
-diff --git a/core/arch/arm/plat-totalcompute/optee_manifest.dts b/core/arc=
h/arm/plat-totalcompute/optee_manifest.dts
-new file mode 100644
-index 00000000..4e60cbe1
---- /dev/null
-+++ b/core/arch/arm/plat-totalcompute/optee_manifest.dts
-@@ -0,0 +1,33 @@
-+/*
-+ * Copyright (c) 2020, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ * This file is a Partition Manifest (PM) for a minimal Secure Partition =
(SP)
-+ * that has additional optional properties defined.
-+ *
-+ */
-+
-+/dts-v1/;
-+
-+/ {
-+	compatible =3D "arm,ffa-manifest-1.0";
-+
-+	/* Properties */
-+	description =3D "op-tee";
-+	ffa-version =3D <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
-+	uuid =3D <0x486178e0 0xe7f811e3 0xbc5e0002 0xa5d5c51b>;
-+	id =3D <1>;
-+	execution-ctx-count =3D <4>;
-+	exception-level =3D <2>; /* S-EL1 */
-+	execution-state =3D <0>; /* AARCH64 */
-+	load-address =3D <0xfd280000>;
-+	entrypoint-offset =3D <0x1000>;
-+	xlat-granule =3D <0>; /* 4KiB */
-+	boot-order =3D <0>;
-+	messaging-method =3D <0>; /* Direct messaging only */
-+	run-time-model =3D <1>; /* Run to completion */
-+
-+	/* Boot protocol */
-+	gp-register-num =3D <0x0>;
-+};
-diff --git a/core/arch/arm/plat-totalcompute/sp_layout.json b/core/arch/ar=
m/plat-totalcompute/sp_layout.json
-new file mode 100644
-index 00000000..05bc7851
---- /dev/null
-+++ b/core/arch/arm/plat-totalcompute/sp_layout.json
-@@ -0,0 +1,6 @@
-+{
-+	"op-tee" : {
-+		"image": "tee-pager_v2.bin",
-+		"pm": "optee_manifest.dts"
-+	}
-+}
---=20
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0008-pl=
at-totalcompute-define-tzdram-start-address-for-S-.patch b/meta-arm-bsp/rec=
ipes-security/optee/files/optee-os/tc0/0008-plat-totalcompute-define-tzdram=
-start-address-for-S-.patch
deleted file mode 100644
index 015bdc9..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0008-plat-tota=
lcompute-define-tzdram-start-address-for-S-.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 1827607c6381339d051a36a84d749c3a50e3463d Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Mon, 16 Nov 2020 17:38:07 +0000
-Subject: [PATCH 5/5] plat-totalcompute: define tzdram start address for S-=
EL1
- SPMC config
-
-Define TZDRAM_START for CFG_CORE_SEL1_SPMC config
-
-Change-Id: I71aaa92a0ecdb791802336ca31ab52e97ee52955
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- core/arch/arm/plat-totalcompute/conf.mk | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/plat-=
totalcompute/conf.mk
-index 34095acf..d330eb92 100644
---- a/core/arch/arm/plat-totalcompute/conf.mk
-+++ b/core/arch/arm/plat-totalcompute/conf.mk
-@@ -24,7 +24,10 @@ endif
- ifeq ($(PLATFORM_FLAVOR),tc0)
- CFG_TEE_CORE_NB_CORE =3D 4
-=20
--ifeq ($(CFG_CORE_SEL2_SPMC),y)
-+ifeq ($(CFG_CORE_SEL1_SPMC),y)
-+CFG_TZDRAM_START ?=3D 0xfd000000
-+CFG_TZDRAM_SIZE  ?=3D 0x02000000
-+else ifeq ($(CFG_CORE_SEL2_SPMC),y)
- CFG_TZDRAM_START ?=3D 0xfd281000
- CFG_TZDRAM_SIZE  ?=3D 0x01d7f000
- else
---=20
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0009-pl=
at-totalcompute-add-Theodul-DSU-support.patch b/meta-arm-bsp/recipes-securi=
ty/optee/files/optee-os/tc0/0009-plat-totalcompute-add-Theodul-DSU-support.=
patch
deleted file mode 100644
index e52a9d0..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0009-plat-tota=
lcompute-add-Theodul-DSU-support.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 3563e39d66404ff2415d29c4018757a85cd0ad97 Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Wed, 13 Jan 2021 13:49:54 +0000
-Subject: [PATCH 1/3] plat-totalcompute: add Theodul DSU support
-
-- Change CPU count from 4 to 8
-- Set heap size to 128K
-- In debug print, change EMSG to DMSG
-
-Change-Id: Ic426f5e08ac4e7ce1be37333486c75a3228e3415
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- core/arch/arm/mm/mobj_ffa.c                        |  2 +-
- core/arch/arm/plat-totalcompute/conf.mk            |  4 +++-
- core/arch/arm/plat-totalcompute/optee_manifest.dts |  2 +-
- core/arch/arm/plat-totalcompute/tc0_spmc_pm.c      | 10 +++++++++-
- 4 files changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/core/arch/arm/mm/mobj_ffa.c b/core/arch/arm/mm/mobj_ffa.c
-index 8e334f04..500404c3 100644
---- a/core/arch/arm/mm/mobj_ffa.c
-+++ b/core/arch/arm/mm/mobj_ffa.c
-@@ -381,7 +381,7 @@ struct mobj *mobj_ffa_get_by_cookie(uint64_t cookie,
- 		if (mf)
- 			DMSG("cookie %#"PRIx64" resurrecting", cookie);
- 		if (!mf) {
--			EMSG("Populating mobj from rx buffer\n");
-+			DMSG("Populating mobj from rx:  %#"PRIx64"", cookie);
- 			mf =3D thread_spmc_populate_mobj_from_rx(cookie);
- 		}
- #endif
-diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/plat-=
totalcompute/conf.mk
-index d330eb92..c35437aa 100644
---- a/core/arch/arm/plat-totalcompute/conf.mk
-+++ b/core/arch/arm/plat-totalcompute/conf.mk
-@@ -22,7 +22,9 @@ platform-aflags-debug-info =3D -gdwarf-2
- endif
-=20
- ifeq ($(PLATFORM_FLAVOR),tc0)
--CFG_TEE_CORE_NB_CORE =3D 4
-+CFG_TEE_CORE_NB_CORE =3D 8
-+
-+CFG_CORE_HEAP_SIZE ?=3D 131072
-=20
- ifeq ($(CFG_CORE_SEL1_SPMC),y)
- CFG_TZDRAM_START ?=3D 0xfd000000
-diff --git a/core/arch/arm/plat-totalcompute/optee_manifest.dts b/core/arc=
h/arm/plat-totalcompute/optee_manifest.dts
-index 4e60cbe1..60cb5957 100644
---- a/core/arch/arm/plat-totalcompute/optee_manifest.dts
-+++ b/core/arch/arm/plat-totalcompute/optee_manifest.dts
-@@ -18,7 +18,7 @@
- 	ffa-version =3D <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
- 	uuid =3D <0x486178e0 0xe7f811e3 0xbc5e0002 0xa5d5c51b>;
- 	id =3D <1>;
--	execution-ctx-count =3D <4>;
-+	execution-ctx-count =3D <8>;
- 	exception-level =3D <2>; /* S-EL1 */
- 	execution-state =3D <0>; /* AARCH64 */
- 	load-address =3D <0xfd280000>;
-diff --git a/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c b/core/arch/arm=
/plat-totalcompute/tc0_spmc_pm.c
-index 8e59a8cc..3fb32823 100644
---- a/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c
-+++ b/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c
-@@ -17,7 +17,11 @@ static const uint64_t core_clus_aff_array[] =3D {
- 	0x0000,		/* Cluster 0 Cpu 0 */
- 	0x0001,		/* Cluster 0 Cpu 1 */
- 	0x0002,		/* Cluster 0 Cpu 2 */
--	0x0003		/* Cluster 0 Cpu 3 */
-+	0x0003,		/* Cluster 0 Cpu 3 */
-+	0x0004,		/* Cluster 0 Cpu 4 */
-+	0x0005,		/* Cluster 0 Cpu 5 */
-+	0x0006,		/* Cluster 0 Cpu 6 */
-+	0x0007		/* Cluster 0 Cpu 7 */
- };
-=20
- void ffa_secondary_cpu_boot_req(vaddr_t secondary_ep, uint64_t cookie)
-@@ -38,6 +42,10 @@ void ffa_secondary_cpu_boot_req(vaddr_t secondary_ep, u=
int64_t cookie)
- 		/* Create an mpidr from core_clus_aff_array */
- 		a1 |=3D core_clus_aff_array[cnt] << aff_shift;
-=20
-+		/* Ignore current cpu */
-+		if (a1 =3D=3D mpidr)
-+			continue;
-+
- 		/* Invoke the PSCI_CPU_ON_SMC64 function */
- 		ret =3D thread_smc(PSCI_CPU_ON_SMC64, a1, secondary_ep, cookie);
-=20
---=20
-2.29.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0010-WI=
P-OP-TEE-SP-declare-device-regions-in-manifest.patch b/meta-arm-bsp/recipes=
-security/optee/files/optee-os/tc0/0010-WIP-OP-TEE-SP-declare-device-region=
s-in-manifest.patch
deleted file mode 100644
index fbc5161..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0010-WIP-OP-TE=
E-SP-declare-device-regions-in-manifest.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From fd325f731da694057a2738411faa2ccbeea71778 Mon Sep 17 00:00:00 2001
-From: Olivier Deprez <olivier.deprez@arm.com>
-Date: Thu, 3 Dec 2020 22:29:37 +0100
-Subject: [PATCH 2/3] WIP OP-TEE SP declare device regions in manifest
-
-Secure Partitions must declare peripherals they access such
-that the SPMC maps IO regions in SP's Stage-2 translation
-regime. OP-TEE currently directly accesses the GIC Distributor
-and the UART0 peripheral hence declare those device regions in
-OP-TEE's manifest.
-
-Change-Id: I1fda46e5cf17153dfaf499042dceff325729d041
-Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
----
- .../arch/arm/plat-totalcompute/optee_manifest.dts | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/core/arch/arm/plat-totalcompute/optee_manifest.dts b/core/arc=
h/arm/plat-totalcompute/optee_manifest.dts
-index 60cb5957..cdc28d98 100644
---- a/core/arch/arm/plat-totalcompute/optee_manifest.dts
-+++ b/core/arch/arm/plat-totalcompute/optee_manifest.dts
-@@ -30,4 +30,19 @@
-=20
- 	/* Boot protocol */
- 	gp-register-num =3D <0x0>;
-+
-+	device-regions {
-+		compatible =3D "arm,ffa-manifest-device-regions";
-+		uart0 {
-+			base-address =3D <0x00000000 0x7ff70000>;
-+			pages-count =3D <1>;
-+			attributes =3D <0x3>; /* read-write */
-+		};
-+
-+		gicd {
-+			base-address =3D <0x00000000 0x30000000>;
-+			pages-count =3D <16>;
-+			attributes =3D <0x3>; /* read-write */
-+		};
-+	};
- };
---=20
-2.29.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0011-WI=
P-OP-TEE-SP-use-CNTVCT-in-place-of-CNTVCT.patch b/meta-arm-bsp/recipes-secu=
rity/optee/files/optee-os/tc0/0011-WIP-OP-TEE-SP-use-CNTVCT-in-place-of-CNT=
VCT.patch
deleted file mode 100644
index 323ace7..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0011-WIP-OP-TE=
E-SP-use-CNTVCT-in-place-of-CNTVCT.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 85110aaf32b6d3b19fdca301f7a07a4683825802 Mon Sep 17 00:00:00 2001
-From: Olivier Deprez <olivier.deprez@arm.com>
-Date: Thu, 3 Dec 2020 17:33:09 +0100
-Subject: [PATCH 3/3] WIP OP-TEE SP use CNTVCT in place of CNTVCT
-
-The SPMC forbids access to the physical counter and Secure Partitions
-shall rather access the virtual counter (for which virtual offset is
-set to 0). More information at [1].
-
-[1] https://lists.trustedfirmware.org/pipermail/hafnium/2020-December/0000=
92.html
-
-Change-Id: Ifab083921fa12154cafc31bd80ce91fa8da0db82
-Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
----
- core/arch/arm/include/arm64.h              | 2 +-
- core/arch/arm/include/kernel/delay.h       | 4 ++--
- core/arch/arm/kernel/arm32_sysreg.txt      | 2 +-
- core/arch/arm/kernel/tee_time_arm_cntpct.c | 4 ++--
- core/kernel/tee_ta_manager.c               | 4 ++--
- lib/libutee/arch/arm/arm32_user_sysreg.txt | 2 +-
- lib/libutee/include/arm64_user_sysreg.h    | 2 +-
- lib/libutils/ext/ftrace/ftrace.c           | 6 +++---
- 8 files changed, 13 insertions(+), 13 deletions(-)
-
-diff --git a/core/arch/arm/include/arm64.h b/core/arch/arm/include/arm64.h
-index 40a6b113..46c5431f 100644
---- a/core/arch/arm/include/arm64.h
-+++ b/core/arch/arm/include/arm64.h
-@@ -322,7 +322,7 @@ DEFINE_U32_REG_READ_FUNC(sctlr_el1)
-=20
- /* ARM Generic timer functions */
- DEFINE_REG_READ_FUNC_(cntfrq, uint32_t, cntfrq_el0)
--DEFINE_REG_READ_FUNC_(cntpct, uint64_t, cntpct_el0)
-+DEFINE_REG_READ_FUNC_(cntvct, uint64_t, cntvct_el0)
- DEFINE_REG_READ_FUNC_(cntkctl, uint32_t, cntkctl_el1)
- DEFINE_REG_WRITE_FUNC_(cntkctl, uint32_t, cntkctl_el1)
- DEFINE_REG_READ_FUNC_(cntps_ctl, uint32_t, cntps_ctl_el1)
-diff --git a/core/arch/arm/include/kernel/delay.h b/core/arch/arm/include/=
kernel/delay.h
-index 00510059..34629ba2 100644
---- a/core/arch/arm/include/kernel/delay.h
-+++ b/core/arch/arm/include/kernel/delay.h
-@@ -44,12 +44,12 @@ static inline uint64_t arm_cnt_us2cnt(uint32_t us)
-=20
- static inline uint64_t timeout_init_us(uint32_t us)
- {
--	return read_cntpct() + arm_cnt_us2cnt(us);
-+	return read_cntvct() + arm_cnt_us2cnt(us);
- }
-=20
- static inline bool timeout_elapsed(uint64_t expire)
- {
--	return read_cntpct() > expire;
-+	return read_cntvct() > expire;
- }
-=20
- #endif
-diff --git a/core/arch/arm/kernel/arm32_sysreg.txt b/core/arch/arm/kernel/=
arm32_sysreg.txt
-index b69ebcb4..155773f8 100644
---- a/core/arch/arm/kernel/arm32_sysreg.txt
-+++ b/core/arch/arm/kernel/arm32_sysreg.txt
-@@ -117,7 +117,7 @@ VBAR  c12 0 c0 0 RW Vector Base Address Register
-=20
- @ B8.2 Generic Timer registers summary
- CNTFRQ    c14 0 c0  0 RW Counter Frequency register
--CNTPCT    -   0 c14 - RO Physical Count register
-+CNTVCT    -   1 c14 - RO Physical Count register
- CNTKCTL   c14 0 c1  0 RW Timer PL1 Control register
- CNTP_TVAL c14 0 c2  0 RW PL1 Physical TimerValue register
- CNTP_CTL  c14 0 c2  1 RW PL1 Physical Timer Control register
-diff --git a/core/arch/arm/kernel/tee_time_arm_cntpct.c b/core/arch/arm/ke=
rnel/tee_time_arm_cntpct.c
-index 3c41e4c2..04e673d9 100644
---- a/core/arch/arm/kernel/tee_time_arm_cntpct.c
-+++ b/core/arch/arm/kernel/tee_time_arm_cntpct.c
-@@ -16,7 +16,7 @@
-=20
- static TEE_Result arm_cntpct_get_sys_time(TEE_Time *time)
- {
--	uint64_t cntpct =3D read_cntpct();
-+	uint64_t cntpct =3D read_cntvct();
- 	uint32_t cntfrq =3D read_cntfrq();
-=20
- 	time->seconds =3D cntpct / cntfrq;
-@@ -49,7 +49,7 @@ REGISTER_TIME_SOURCE(arm_cntpct_time_source)
-=20
- void plat_prng_add_jitter_entropy(enum crypto_rng_src sid, unsigned int *=
pnum)
- {
--	uint64_t tsc =3D read_cntpct();
-+	uint64_t tsc =3D read_cntvct();
- 	int bytes =3D 0, n;
- 	static uint8_t first, bits;
- 	static uint16_t acc;
-diff --git a/core/kernel/tee_ta_manager.c b/core/kernel/tee_ta_manager.c
-index 46632ce7..4153fbd8 100644
---- a/core/kernel/tee_ta_manager.c
-+++ b/core/kernel/tee_ta_manager.c
-@@ -923,7 +923,7 @@ static void gprof_update_session_utime(bool suspend, s=
truct ts_session *s,
- static void tee_ta_update_session_utime(bool suspend)
- {
- 	struct ts_session *s =3D ts_get_current_session();
--	uint64_t now =3D read_cntpct();
-+	uint64_t now =3D read_cntvct();
-=20
- 	gprof_update_session_utime(suspend, s, now);
- }
-@@ -947,7 +947,7 @@ static void ftrace_update_times(bool suspend)
- 	uint64_t now =3D 0;
- 	uint32_t i =3D 0;
-=20
--	now =3D read_cntpct();
-+	now =3D read_cntvct();
-=20
- 	fbuf =3D s->fbuf;
- 	if (!fbuf)
-diff --git a/lib/libutee/arch/arm/arm32_user_sysreg.txt b/lib/libutee/arch=
/arm/arm32_user_sysreg.txt
-index 8baefd10..13e28f20 100644
---- a/lib/libutee/arch/arm/arm32_user_sysreg.txt
-+++ b/lib/libutee/arch/arm/arm32_user_sysreg.txt
-@@ -10,4 +10,4 @@
-=20
- @ B8.2 Generic Timer registers summary
- CNTFRQ    c14 0 c0  0 RW Counter Frequency register
--CNTPCT    -   0 c14 - RO Physical Count register
-+CNTVCT    -   1 c14 - RO Physical Count register
-diff --git a/lib/libutee/include/arm64_user_sysreg.h b/lib/libutee/include=
/arm64_user_sysreg.h
-index db4ee188..722a08c9 100644
---- a/lib/libutee/include/arm64_user_sysreg.h
-+++ b/lib/libutee/include/arm64_user_sysreg.h
-@@ -31,7 +31,7 @@ static inline __noprof void write_##reg(type val)		\
-=20
- /* ARM Generic timer functions */
- DEFINE_REG_READ_FUNC_(cntfrq, uint32_t, cntfrq_el0)
--DEFINE_REG_READ_FUNC_(cntpct, uint64_t, cntpct_el0)
-+DEFINE_REG_READ_FUNC_(cntvct, uint64_t, cntvct_el0)
- DEFINE_REG_READ_FUNC_(tpidr_el0, uint64_t, tpidr_el0)
- DEFINE_REG_WRITE_FUNC_(tpidr_el0, uint64_t, tpidr_el0)
-=20
-diff --git a/lib/libutils/ext/ftrace/ftrace.c b/lib/libutils/ext/ftrace/ft=
race.c
-index 101aa594..637cbd19 100644
---- a/lib/libutils/ext/ftrace/ftrace.c
-+++ b/lib/libutils/ext/ftrace/ftrace.c
-@@ -165,7 +165,7 @@ void __noprof ftrace_enter(unsigned long pc, unsigned =
long *lr)
-=20
- 	if (fbuf->ret_idx < FTRACE_RETFUNC_DEPTH) {
- 		fbuf->ret_stack[fbuf->ret_idx] =3D *lr;
--		fbuf->begin_time[fbuf->ret_idx] =3D read_cntpct();
-+		fbuf->begin_time[fbuf->ret_idx] =3D read_cntvct();
- 		fbuf->ret_idx++;
- 	} else {
- 		/*
-@@ -269,7 +269,7 @@ unsigned long __noprof ftrace_return(void)
- 		dur_loc =3D curr_buf - (fbuf->ret_idx +
- 				      (2 * sizeof(unsigned long)) + 11);
- 		ftrace_duration(dur_loc, fbuf->begin_time[fbuf->ret_idx],
--				read_cntpct());
-+				read_cntvct());
- 	} else {
- 		bool full =3D false;
-=20
-@@ -297,7 +297,7 @@ unsigned long __noprof ftrace_return(void)
- 			dur_loc =3D curr_buf - fbuf->ret_idx - 6;
- 			ftrace_duration(dur_loc,
- 					fbuf->begin_time[fbuf->ret_idx],
--					read_cntpct());
-+					read_cntvct());
- 		}
- 	}
-=20
---=20
-2.29.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/sp_layo=
ut.json b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/sp_layout.=
json
new file mode 100644
index 0000000..d37d902
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/sp_layout.json
@@ -0,0 +1,6 @@
+{
+	"op-tee" : {
+		"image": "tee-pager_v2.bin",
+		"pm": "optee_sp_manifest.dts"
+	}
+}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client-tc0.inc b/met=
a-arm-bsp/recipes-security/optee/optee-client-tc0.inc
index ad9c475..d460b50 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-client-tc0.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-client-tc0.inc
@@ -1,12 +1,3 @@
 # TC0 specific configuration
=20
-# Intermediate SHA with 3.11 baseline version
-SRCREV =3D "3f44b870299514ad8c6b7dee776eb2994d9c1cd4"
-PV =3D "3.11.0+git${SRCPV}"
-
-FILESEXTRAPATHS_prepend_tc0 :=3D "${THISDIR}/files/optee-client/tc0:"
-
-SRC_URI_append =3D " \
-    file://0001-Revert-libteec-Avoid-memcpy-when-using-TEEC_TempMemo.patch=
 \
-    file://0002-Allocate-page-aligned-shared-memory-buffers.patch \
-    "
+# Change in SHA, extra patches specific to TC0 are added in this file.
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client_3.11.0.bbappe=
nd b/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/optee-client_3.11.0.bbappen=
d
rename to meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc b/meta-ar=
m-bsp/recipes-security/optee/optee-os-tc0.inc
index 1b03a35..7afc112 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
@@ -1,31 +1,12 @@
 # TC0 specific configuration
=20
-# Intermediate SHA with 3.11 baseline version
-SRCREV =3D "3284d935bc7e7bf7abfb5b19394a387d975d6dd4"
-PV =3D "3.11.0+git${SRCPV}"
-
-# This is incorporated into the SRCREV above
-SRC_URI_remove =3D " \
-    file://0001-libutils-provide-empty-__getauxval-implementation.patch \
-    file://0002-link.mk-implement-support-for-libnames-after-libgcc-.patch=
 \
-    file://0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch=
 \
-    "
+# Intermediate SHA with 3.14 baseline version
+# This has TC0 platform support
+SRCREV =3D "49dbb9ef65643c4322cf3f848910fa880d1c02f6"
+PV =3D "3.14.0+git${SRCPV}"
=20
 FILESEXTRAPATHS_prepend_tc0 :=3D "${THISDIR}/files/optee-os/tc0:"
-
-SRC_URI_append =3D " \
-    file://0001-core-SPMC-update-for-FF-A-version-1.0.patch \
-    file://0002-core-add-thread_smccc.patch \
-    file://0003-core-enable-SPCI-with-SPM-Core-at-S-EL2.patch \
-    file://0004-core-fixes-to-align-with-upstream-hafnium.patch \
-    file://0005-core-arm-Total-Compute-platform-support.patch \
-    file://0006-plat-totalcompute-Add-support-for-S-EL2-SPMC.patch \
-    file://0007-plat-totalcompute-add-optee-manifest-file-and-sp-lay.patch=
 \
-    file://0008-plat-totalcompute-define-tzdram-start-address-for-S-.patch=
 \
-    file://0009-plat-totalcompute-add-Theodul-DSU-support.patch \
-    file://0010-WIP-OP-TEE-SP-declare-device-regions-in-manifest.patch \
-    file://0011-WIP-OP-TEE-SP-use-CNTVCT-in-place-of-CNTVCT.patch \
-    "
+SRC_URI_append =3D "file://sp_layout.json"
=20
 COMPATIBLE_MACHINE =3D "tc0"
=20
@@ -42,13 +23,11 @@ EXTRA_OEMAKE +=3D " CFG_WITH_STATS=3Dy"
=20
 EXTRA_OEMAKE +=3D " CFG_CORE_SEL2_SPMC=3Dy"
=20
-# Copy optee manifest file and sp_layout
-# This function will be modified or removed once upstream optee-os adds su=
pport
-# for SEL2 SPMC config
+# Copy optee manifest file
 do_install_append() {
     install -d ${D}${nonarch_base_libdir}/firmware/
-    install -m 644 ${S}/core/arch/arm/plat-totalcompute/sp_layout.json \
-        ${D}${nonarch_base_libdir}/firmware/
-    install -m 644 ${S}/core/arch/arm/plat-totalcompute/optee_manifest.dts=
 \
+    install -m 644 ${WORKDIR}/sp_layout.json ${D}${nonarch_base_libdir}/fi=
rmware/
+    install -m 644 \
+        ${S}/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts \
         ${D}${nonarch_base_libdir}/firmware/
 }
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.11.0.bbappend b=
/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/optee-os_3.11.0.bbappend
rename to meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test-tc0.inc b/meta-=
arm-bsp/recipes-security/optee/optee-test-tc0.inc
index cca5076..832fea1 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-test-tc0.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-test-tc0.inc
@@ -1,14 +1,3 @@
 # TC0 specific configuration
=20
-# Intermediate SHA with 3.11 baseline version
-SRCREV =3D "b35df64954ef96e09c0d5573014f4d1432dbc92f"
-PV =3D "3.11.0+git${SRCPV}"
-
-# This is incorporated into the SRCREV above
-SRC_URI_remove =3D " \
-    file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
-    file://0002-make-remove-Wno-unsafe-loop-for-clang.patch \
-    file://0003-make-remove-Wmissing-noreturn-for-clang.patch \
-"
-
 COMPATIBLE_MACHINE =3D "tc0"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.11.0.bbappend=
 b/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/optee-test_3.11.0.bbappend
rename to meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
--=20
2.29.2

