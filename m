Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.75])
 by mx.groups.io with SMTP id smtpd.web09.605.1625076117070390417
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jun 2021 11:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yR3CsXcS;
 spf=pass (domain: arm.com, ip: 40.107.15.75, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2x2dd9sILYE4AoUEFV9yYxfB1tTlMiUpxHE2OUSZaRU=;
 b=yR3CsXcS7nqUH0sr6aBalleXN8d/APGChPsQNc3sWYLpP1rkU4uzn2pA8pD5nlM/v+H6llyz1r9srj8Q9Bn0LlWpMegMbEm8kvie7+eLIYZttVB9jBb2vBEkZb7x59kWtKpcBYyssNSb5NqzqYUCy7/q5FFPil2384CvcPr9xig=
Received: from AM6P194CA0089.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::30)
 by VI1PR08MB3823.eurprd08.prod.outlook.com (2603:10a6:803:c2::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 30 Jun
 2021 18:01:53 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::b9) by AM6P194CA0089.outlook.office365.com
 (2603:10a6:209:8f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Wed, 30 Jun 2021 18:01:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Wed, 30 Jun 2021 18:01:52 +0000
Received: ("Tessian outbound 71a9bd19c2b9:v97"); Wed, 30 Jun 2021 18:01:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2f76ffffb46b23b0
X-CR-MTA-TID: 64aa7808
Received: from 45642cd43b91.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C1110685-03D2-492C-A48A-34DE00A0FC27.1;
	Wed, 30 Jun 2021 18:01:45 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 45642cd43b91.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 30 Jun 2021 18:01:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gntuO4nKKK5x+GT3EtVBPa18w59oK0OZSZ/iO39k/jRg1Vky2FSQip9O2XD6G/gJUZQPLFSg/bHxgPdKfCt+eBAyu9IwE+LcBKUHnsff6lO50Y8ayr1qykW4lMYU0CmahVEoc73XGYVFEt4ohQaJgm7OQ2gnVRC5Vot+HfHYNMatqzIdtH5aR8Tkh2WsP+nU8/JebS8CwF4HaahayqmFlqCK2OqiIc5+o9IxONF5rYZ1SrYBesZVY24lVf8GsmdkebBzf7rwrWCmwUT4ttCxciP+MgT6bJEPBuq+SrYCxo3g5DbF7KMoSDAy9RkbyhM+vyxuwHT0AYHhWT9gLsnzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2x2dd9sILYE4AoUEFV9yYxfB1tTlMiUpxHE2OUSZaRU=;
 b=k59wzUL2FOcJmQNHCvyFLU4LaVKZXg5joDgsKtgO89P0PnW2+rlVUvhVUO3gGBtSLBNOKYXI6YX0Lxixm4YbyF9k3q+qWPlPn5+6V8GoBRhrhRJDqosCUXuJLDPX4CzAi9HO+PiAG58qlSfkvDK5FqNt0LEm7aBt2E0dHdtIlcAtuIvHhzzaSPlggU0+RQGOA9U0veZFRUjKiWebAYcOIKblgXN/A2vK/ZmqMLBKGy/hQavyXljVFlR+A//mtELCBjuvNiV+ZjLtpRQoAHhllI28n/zG//S+o+KEGWZXtGgu1QTTzpZgNX8aWCu/LQJc1APgn8J8yAq+XnMBn9ALBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2x2dd9sILYE4AoUEFV9yYxfB1tTlMiUpxHE2OUSZaRU=;
 b=yR3CsXcS7nqUH0sr6aBalleXN8d/APGChPsQNc3sWYLpP1rkU4uzn2pA8pD5nlM/v+H6llyz1r9srj8Q9Bn0LlWpMegMbEm8kvie7+eLIYZttVB9jBb2vBEkZb7x59kWtKpcBYyssNSb5NqzqYUCy7/q5FFPil2384CvcPr9xig=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3830.eurprd08.prod.outlook.com (2603:10a6:20b:80::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Wed, 30 Jun
 2021 18:01:43 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::5814:4d70:f7d9:a6c2]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::5814:4d70:f7d9:a6c2%3]) with mapi id 15.20.4242.023; Wed, 30 Jun 2021
 18:01:43 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm-autonomy: fixes for yocto-check-layer
Date: Wed, 30 Jun 2021 19:01:36 +0100
Message-Id: <c3a19ee4782bf8049b74513852f77d5735f4b91b.1625074123.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-ClientProxiedBy: LO2P265CA0220.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::16) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.53) by LO2P265CA0220.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:b::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend Transport; Wed, 30 Jun 2021 18:01:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55e8442b-de87-443a-7835-08d93bf123f5
X-MS-TrafficTypeDiagnostic: AM6PR08MB3830:|VI1PR08MB3823:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3823E27098255334BBC43FF292019@VI1PR08MB3823.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 nuJ9sEg0HdTAUKJVTlFU8ZRKmFVkcNHS/xWVEvNN/BqDUhOZyR8LsbqbVdDMVKqxOYmJgedZS7fGsvBnml+DDDet4854o0/M0lJ+mzoEoXvFGzwEtB24//ALSoBlYwMykWHFalB0MRqjF3xSOzLzAzp6DBpsTwDbpid2ZWt2l6rA7hp4yOATCo0ynOFtl/f6AdeD0bnMwW6798nynpJSfvYbiWMQtbhaBCRSezhlOHQ+fbKxrt1q6AxXXi3HbGWMrT2G0Ubt9N6Mv2PqZS4TDSzALKWbxoICEzDtpKj2m8QuJSBqhr5kjnh1h35bUspUr6+3C/oP4UW7L7FHTUBPdGdvi3Bcov5wE3JtGJpVL4atgFjFh8nPTHW9I4Hl8B4Z1LsCHUTQP/+DEGFTazon7VTbl7GWbRkPMDEu9YttUqXyjabDV6zQniS9MHXFo+Pi8BhAvLYCk86L2GLcsM+mRBbjg+NVpYgvbEOiSXUiCGkdll8ToQlTTpq9aMhjzKRZ6AgXMOD/9y5TheguT6+TwxNSkNyySzpueIJEr85XF7WQB4qq7z9jdPu3vzY8i04pfmENcmE+y0exV/XFUJVupLuuph+tmdthFbRyj+BWyUvrmrYIpbu53Wqw/rI47ws75L5GOqOFaRQW7ZvcYZynzj6msiXi2PTnlKvhWdMzaE0RS3ZCIbxCZCizKPIW34ohQ2jme4Ui64ZjreWT1DcbxF4mTCOZVprdfVWEv7ETosS+pbEySERLXtQeSDha/E4h
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(366004)(376002)(396003)(8936002)(316002)(4326008)(6916009)(7696005)(5660300002)(83380400001)(16526019)(186003)(8676002)(38350700002)(38100700002)(6666004)(26005)(6486002)(36756003)(30864003)(2906002)(66556008)(66946007)(478600001)(52116002)(86362001)(66476007)(44832011)(2616005)(956004)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?TperiFDmeM8Nnxx8tB9bmtEcxAjlcf1rjj4/KURC/paiDZiwSSWXmeOeyQq1?=
 =?us-ascii?Q?v+NDVfTGmIaE6bnhCHoILn2Za3XsRmuDMOg10o+jCI95noqp+mUJP15jhRbk?=
 =?us-ascii?Q?z2cXUH5KHZKjzIVDYiuA3u1azHMwsivI8vSbTAh5I+P++LEDSOun7FpOLSk1?=
 =?us-ascii?Q?0p/+2R2uR0G91GtbskHzsUq4sQUBrQQouWq/OGy0o5FqHb+z4md8kC4Xn5aW?=
 =?us-ascii?Q?MuzNQJzaCesygWOO09GPUVKC+ubN+wvqTYy3wzFKClAq9zIKmL9yg1AjjfwJ?=
 =?us-ascii?Q?rrTxbzIrnq5o9cvgFlwRSttVP0t7TdW13HU7LB+zxojlZGi7FWqAmEYjTJeb?=
 =?us-ascii?Q?gHa9BtVmNaD/sLQCTKhKtYigtnZcR2H37YVkaezHXPWO96N2zCdDzeFCAeBX?=
 =?us-ascii?Q?yKBtUJrN5qRH5qk1d1VLva04tN2dKKXdBzV6vCC3EQNabctXwJQl0X6lq4es?=
 =?us-ascii?Q?GGgKPgh7F71EEfvfXaCOjpxVeGp/+2bdnb98rthpXRPWIC6czNvG+/b0uoLh?=
 =?us-ascii?Q?MzvQ9YqJ+n2KXiZKhEyG1kHyxKlgk5YBXKJ46oAnkiRKvxyY1qgnQ4yoXDiP?=
 =?us-ascii?Q?gmJSGSyIGckydAAn2t5Bzm5S64KlKlByXsAHhkEDcqH9AIrskUn5mN6as/fc?=
 =?us-ascii?Q?IeUshVckoJQtvjG5C0GQ1j/V1kc3KwFzCD4H6jPUGN3mDSpNNv+6Z70Cb4cK?=
 =?us-ascii?Q?Bka0uoxCuhX7kgg7/SH4n0mKbfg6Y5FHZlaRpJQ67gDwttiOJpmPNSzYWYTF?=
 =?us-ascii?Q?pXrLwaNX5crxNLYvhmEp+WjfXFFmQYG4bWfai1INKxFcPpvRrAkhnEJQbWc3?=
 =?us-ascii?Q?fhGi962qgKCclr5Tmx4y1B6OYXLAR47rrbqMiTyFIuupX4c2CqPjB8DOsRHp?=
 =?us-ascii?Q?ci9ZA3HxUKG0ZshsN993b/OgBNnWwe5A4HcdSqwzLhH8gal5sfBbjHEWOJik?=
 =?us-ascii?Q?2JBJg5E7fsfFUd6oXOFbmwKTXbiuv/Q8+faszPXq19wN3ealzU6944SIVUuw?=
 =?us-ascii?Q?86aZ+pgUbxWR12goA8nkiV28tepNLX38G0ojnNCWxb+7oClH9oxFFn0LWbZ0?=
 =?us-ascii?Q?nsL+CGyzWoEkwaocw7I7HXgm/dr/MGx/Ovg6G6ng4puUmjmkpBKSHyNTK9m7?=
 =?us-ascii?Q?rW5MNnq1nfSL9G06THkmj/aBXdbztbW06qX+dkLziJZRVm52QmUB5ugU+NwA?=
 =?us-ascii?Q?1NgoUnB01Ye0YmVZosPgDXVI1r5ZcOxsxCo1g6W/iqXGE4MPT4Gbv8fUXMYQ?=
 =?us-ascii?Q?0Owma1zYLJUIskbloq3OHot0pxlgfe9IihsiIdPR0J4EleX3PEi3b5BNIsAZ?=
 =?us-ascii?Q?Xz3CaMvH40c3BiVHjOnFs3ml?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3830
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	025651c0-ab27-4789-9467-08d93bf11e84
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i1tVmGXkEMSe8PvizvBxerY3SVvqZ1ZbgOqqIXx/UcVpnWWW/NCcuqnr+Ku3BvI+LbuFvBrGPJBE+RbSXqP6buNjMzKhFLT0PDzUai7E8IB/XYo/wmE8c4aUD4Ueaoqpxk8yQroI62Ic/7AYiNWST4+rDp8mrtrieabCGpUgSL9icFQBqSJfoC48PfAhN7t8MN3ZTJWH2ARh7wpm7MuKsDK7CVkNpqWvGOJZGZqJj1CU5y87u1JyTPat0s87oaOH5XD2Ab3zBeA7CX19VgsMj0akhpEMMOPAirqzWcefiXPIThxUgaogcoU/JFBxwqxVzcLyNkV4H7VfoKfb3VkSekaJk2Ajqwu4Ar+QvPRHKwvWh8bnxE/oC5mlxgGa0mx+QS5AQkUpS69qyhQTsgPxdqxwdeUErJjLLGeu9j/76p78S+BC38qAr4CzHbr2o1a1mKbvuDRApPqzmwNiwF/OpbwNeTjDlVCWRaNWOIosPjMVFqAwiczovsm95a/ZocsVGHq3YFDgHZG+EItIWc5gFSiCw6sqy7ap6cugHGh5a6pqkRZjrYvwKiYkpTZTi5D5kT71QmqCend1iDA/U+h5GqY89EihkOj3AYhZk8UETMNXZBiwzkOZgvQvr6IN2Pp5/UBxGpvlMySdXNiSwX1QH9ZzHXTYu+5rZTxPxE8cvfDqggXEeWg+o6W0Cs9HiVvmLt0tvrPrN+fhg+S0YZNjH7Gulo3nSAXTEA5WJ6KwBKCqqVmzZe4l3RHVRBD+BcO7
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39840400004)(136003)(376002)(36840700001)(46966006)(16526019)(2616005)(82310400003)(47076005)(6486002)(186003)(8676002)(26005)(70206006)(8936002)(36860700001)(36756003)(7696005)(5660300002)(478600001)(356005)(6916009)(44832011)(2906002)(30864003)(83380400001)(4326008)(336012)(6666004)(86362001)(81166007)(956004)(316002)(70586007)(414714003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 18:01:52.4873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e8442b-de87-443a-7835-08d93bf123f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3823
Content-Type: text/plain

Add fixes for yocto-check-layer with no new functionality introduced.

Issue-Id: SCM-2625
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I4f7dc30e7ca27f88dfe140ac84ff2b73fe99b728
---
 .../conf/distro/include/arm-autonomy-host.inc    |  2 ++
 .../images/firmware-image-juno.bbappend          |  2 +-
 .../recipes-bsp/u-boot/u-boot_%.bbappend         |  9 +++++----
 .../bsp/arm-platforms/n1sdp/n1sdp-preempt-rt.scc |  6 ------
 .../features/arm-autonomy/preempt-rt-extras.cfg  |  7 -------
 .../features/arm-autonomy/preempt-rt-extras.scc  |  3 ---
 .../recipes-kernel/linux/linux-%.bbappend        | 16 +++++++++-------
 .../recipes-bsp/grub/grub-efi_%.bbappend         |  4 +++-
 .../recipes-core/busybox/busybox_%.bbappend      |  8 ++++++--
 .../init-ifupdown/init-ifupdown_1.0.bbappend     |  4 +++-
 .../recipes-devtools/qemu/qemu-autonomy-host.inc |  8 ++++++++
 .../recipes-devtools/qemu/qemu_%.bbappend        | 15 +++------------
 .../recipes-extended/xen/xen-tools_4.14.bbappend |  9 ++++++---
 .../recipes-extended/xen/xen_%.bbappend          | 11 ++++++-----
 .../recipes-extended/xen/xen_4.14.bbappend       |  8 ++++++--
 .../recipes-kernel/linux/linux-%.bbappend        |  6 ++++--
 16 files changed, 62 insertions(+), 56 deletions(-)
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/bsp/arm-platforms/n1sdp/n1sdp-preempt-rt.scc
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.cfg
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.scc
 create mode 100644 meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-host.inc

diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
index 3a4e89f..a7fe523 100644
--- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
+++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
@@ -1,5 +1,7 @@
 # This files is added when DISTRO_FEATURES contains arm-autonomy-host
 
+ARM_AUTONOMY_HOST_OVERRIDES = ":autonomy-host"
+
 # We need to have xen and ipv4 activated
 DISTRO_FEATURES_append = " xen ipv4"
 DISTRO_FEATURES_NATIVE_append = " arm-autonomy-host"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
index d855136..6e75af2 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
@@ -1,6 +1,6 @@
 # Use OVERRIDES to minimize the usage of
 # ${@bb.utils.contains('DISTRO_FEATURES', 'autonomy-host', ...
-OVERRIDES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ':autonomy-host', '', d)}"
+OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
 
 FILESEXTRAPATHS_prepend_autonomy-host := "${THISDIR}/${PN}:"
 
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index e1ba91f..10cd0d6 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -1,9 +1,10 @@
-# Machine specific u-boot
+# Use OVERRIDES to minimize the usage of
+# ${@bb.utils.contains('DISTRO_FEATURES', 'autonomy-host', ...
+OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS_prepend_autonomy-host_fvp-base := "${THISDIR}/${PN}:"
 
 #
 # FVP BASE
 #
-
-SRC_URI_append_fvp-base = "${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ' file://xen_u-boot_kernel_addr.patch', '', d)}"
+SRC_URI_append_autonomy-host_fvp-base = " file://xen_u-boot_kernel_addr.patch"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/bsp/arm-platforms/n1sdp/n1sdp-preempt-rt.scc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/bsp/arm-platforms/n1sdp/n1sdp-preempt-rt.scc
deleted file mode 100644
index 414732c..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/bsp/arm-platforms/n1sdp/n1sdp-preempt-rt.scc
+++ /dev/null
@@ -1,6 +0,0 @@
-define KMACHINE n1sdp
-define KTYPE preempt-rt
-define KARCH arm64
-
-kconf non-hardware ktypes/developer/developer.cfg
-kconf non-hardware ktypes/preempt-rt/preempt-rt.cfg
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.cfg
deleted file mode 100644
index bf9e14b..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.cfg
+++ /dev/null
@@ -1,7 +0,0 @@
-# Yocto kernel-cache sets CONFIG_NLS_CODEPAGE_437=m for LINUX_KERNEL_TYPR=preempt-rt
-CONFIG_NLS_CODEPAGE_437=y
-# Yocto kernel-cache sets CONFIG_NLS_ISO8859_1=m for LINUX_KERNEL_TYPR=preempt-rt
-CONFIG_NLS_ISO8859_1=y
-
-# Set the timer interrupt run at 1000 Hz to have a fast response
-CONFIG_HZ_1000=y
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.scc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.scc
deleted file mode 100644
index 676291b..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.scc
+++ /dev/null
@@ -1,3 +0,0 @@
-define KFEATURE_DESCRIPTION "Extra kernel configs when building with PREEMPT_RT"
-
-kconf non-hardware preempt-rt-extras.cfg
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
index c8eaad7..f590e71 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
@@ -1,15 +1,17 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}:"
+# Use OVERRIDES to minimize the usage of
+# ${@bb.utils.contains('DISTRO_FEATURES', 'autonomy-host', ...
+OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
+
+FILESEXTRAPATHS_prepend_autonomy-host_fvp-base := "${THISDIR}:"
 
 #
 # arm-autonomy kmeta extra
 #
-SRC_URI_append = " file://arm-autonomy-kmeta-extra;type=kmeta;name=arm-autonomy-kmeta-extra;destsuffix=arm-autonomy-kmeta-extra"
+SRC_URI_append_autonomy-host_fvp-base = " \
+    file://arm-autonomy-kmeta-extra;type=kmeta;name=arm-autonomy-kmeta-extra;destsuffix=arm-autonomy-kmeta-extra"
 
 # We need to turn off SVE support in the Linux kernel otherwise Xen is stopping
 # Linux kernel with a coredump while trying to access XEN bit of CPACR1 core
 # register.
-LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE = "${@bb.utils.contains_any('DISTRO_FEATURES', \
-                                         'arm-autonomy-host arm-autonomy-guest', \
-                                         ' features/arm-autonomy/disable-arm64-sve.scc','',d)}"
-
-KERNEL_FEATURES_append_fvp-base = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
+KERNEL_FEATURES_append_autonomy-host_fvp-base = " \
+    features/arm-autonomy/disable-arm64-sve.scc"
diff --git a/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend b/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
index c59fd09..e88edfd 100644
--- a/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
+++ b/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
@@ -1 +1,3 @@
-GRUB_BUILDIN += "${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', 'xen_boot', '', d)}"
+OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
+
+GRUB_BUILDIN_append_autonomy-host = " xen_boot"
diff --git a/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend b/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend
index e335581..36c4569 100644
--- a/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend
+++ b/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend
@@ -1,4 +1,8 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+# Use OVERRIDES to minimize the usage of
+# ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ...
+OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
+
+FILESEXTRAPATHS_prepend_autonomy-host := "${THISDIR}/${PN}:"
 
 # The --exclude flag in Busybox tar is required by xenguest-mkimage
-SRC_URI += "file://feature_tar_long_options.cfg"
+SRC_URI_append_autonomy-host = " file://feature_tar_long_options.cfg"
diff --git a/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend b/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
index 1d97e50..a4edd05 100644
--- a/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
+++ b/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
@@ -3,7 +3,9 @@
 # configuration by adding network network interface configuration file under
 # interfaces.d directory.
 
-do_install_append() {
+OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
+
+do_install_append_autonomy-host() {
     # Add scan of interfaces.d to interfaces file
     cp -f ${WORKDIR}/interfaces ${WORKDIR}/interfaces.subdir
     echo "source-directory ${sysconfdir}/network/interfaces.d/" \
diff --git a/meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-host.inc b/meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-host.inc
new file mode 100644
index 0000000..085f952
--- /dev/null
+++ b/meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-host.inc
@@ -0,0 +1,8 @@
+# For Xen we only need the i386 binaries
+QEMU_TARGETS = "i386"
+
+PACKAGECONFIG[noaudio] = "--audio-drv-list='',,"
+PACKAGECONFIG_append = " noaudio"
+PACKAGECONFIG_remove = "fdt sdl kvm"
+
+require recipes-devtools/qemu/qemu-package-split.inc
diff --git a/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend b/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
index e2e1fe5..0be5651 100644
--- a/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
+++ b/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
@@ -1,12 +1,3 @@
-# Use OVERRIDES to minimize the usage of
-# ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ...
-OVERRIDES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ':autonomy-host', '', d)}"
-
-# For Xen we only need the i386 binaries
-QEMU_TARGETS_autonomy-host = "i386"
-
-PACKAGECONFIG[noaudio] = "--audio-drv-list='',,"
-PACKAGECONFIG_append_autonomy-host = " noaudio"
-PACKAGECONFIG_remove_autonomy-host = "fdt sdl kvm"
-
-require ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', 'recipes-devtools/qemu/${BPN}-package-split.inc', '', d)}
+require ${@bb.utils.contains('DISTRO_FEATURES', \
+                             'arm-autonomy-host', \
+                             'qemu-autonomy-host.inc', '', d)}
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend
index ea45f31..21192c3 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend
+++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend
@@ -1,4 +1,7 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
+# Use OVERRIDES to minimize the usage of
+# ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ...
+OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
 
-SRC_URI += "file://0001-vif-nat-fix-hostname.patch \
-           "
+FILESEXTRAPATHS_prepend_autonomy-host := "${THISDIR}/${PN}-4.14:"
+
+SRC_URI_append_autonomy-host = " file://0001-vif-nat-fix-hostname.patch"
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
index 9403389..4871ef8 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
+++ b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
@@ -1,9 +1,10 @@
+# Use OVERRIDES to minimize the usage of
+# ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ...
+OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
+
 # Make Xen machine specific
 # This ensures that sstate is properly handled and that each machine can have
 # its own configuration
-PACKAGE_ARCH = "${MACHINE_ARCH}"
+PACKAGE_ARCH_autonomy-host = "${MACHINE_ARCH}"
 
-PACKAGECONFIG_remove = "\
-    ${@bb.utils.contains('DISTRO_FEATURES', \
-                         'arm-autonomy-host', \
-                         'sdl', '', d)}"
+PACKAGECONFIG_remove_autonomy-host = "sdl"
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
index f4196ff..5e9ff85 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
+++ b/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
@@ -1,5 +1,9 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
+# Use OVERRIDES to minimize the usage of
+# ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ...
+OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
 
-SRC_URI += " \
+FILESEXTRAPATHS_prepend_autonomy-host := "${THISDIR}/${PN}-4.14:"
+
+SRC_URI_append_autonomy-host = " \
     file://0001-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch \
     "
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-%.bbappend b/meta-arm-autonomy/recipes-kernel/linux/linux-%.bbappend
index add7042..84a325c 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-%.bbappend
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-%.bbappend
@@ -1,3 +1,5 @@
 # Add arm-autonomy kernel support
-require linux-arm-autonomy.inc
-
+require ${@bb.utils.contains_any('DISTRO_FEATURES', \
+                                 'arm-autonomy-host arm-autonomy-guest', \
+                                 'linux-arm-autonomy.inc', \
+                                 '', d)}
-- 
2.17.1

