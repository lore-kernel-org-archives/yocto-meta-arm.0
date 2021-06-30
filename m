Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.85])
 by mx.groups.io with SMTP id smtpd.web08.564.1625076116259463944
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jun 2021 11:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xfh1fMA4;
 spf=pass (domain: arm.com, ip: 40.107.14.85, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkBcJMHHPzkRtSjlHeC+XtKqMnG1OxgVB/A7DuHts5g=;
 b=xfh1fMA4h7WFFgewBFsWrCZ3HeVQ3qrj4wUmvAo/S9pKUINH4Ajec0a/0QdMw3fPmfCe/QUYOBHeAchM96NRXOys5nwBMkhRW2iqEGYm4fAru/BCw5d9XyQawPgPJYlv2oE8RGPOLSTZUeIU7+7VoPJ+aPPOHW1MlL6ttKL8LCc=
Received: from AM6P194CA0095.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::36)
 by PAXPR08MB6367.eurprd08.prod.outlook.com (2603:10a6:102:df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 30 Jun
 2021 18:01:53 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::d7) by AM6P194CA0095.outlook.office365.com
 (2603:10a6:209:8f::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Wed, 30 Jun 2021 18:01:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Wed, 30 Jun 2021 18:01:52 +0000
Received: ("Tessian outbound 5d90d3e3ebc7:v97"); Wed, 30 Jun 2021 18:01:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 22ba04a8af53301e
X-CR-MTA-TID: 64aa7808
Received: from 45642cd43b91.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 80BCCA48-DE5F-401E-955D-09109A9E2E00.1;
	Wed, 30 Jun 2021 18:01:45 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 45642cd43b91.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 30 Jun 2021 18:01:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRelno/24999vpTw48pDXJAMWtM53KprK5VCDqRTsfVgzyo3r3vhL8qQkyJzS2HHukDuVhEFSpEuLoWyWIwbVHe25YAnGpulbo9OhQ+wPSxGYJdTbbm4WEMlI8FtFokvF5iQJFeR/LGesVOTiRcIAjlSrIZboSPH4ZXOm3NrDTICs/Du07VssmoSLbJtkzajcs1onzJO5JzRdTO+n+fQmXrrvSh924N48ZQb9Ki2msESx9nhiU3pdeZz6auc2gEQNnmxmcPkIkN8DPhTyEvnHTmJe5X/RRx8R/9BOftNBm0VLzylhAmKW0twEL2FWj6ZNe8kgrQshhz28GMDd4lg+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkBcJMHHPzkRtSjlHeC+XtKqMnG1OxgVB/A7DuHts5g=;
 b=HR98EoMD8x7es4oTnyF8N14l81cXVKYIr6hqWwItwLHQX8SBbmLmE+hii8a8TZcTI15wUVNixaTVhIFXVZfnUzKpLzqeKA0bykf/m/HrKeIwlOEqv1y9yiN7wJkNUpcvQyfymGV31YpbP6j4uRT7/YbSdFgjxcYV64JQ5jaBKHHOuLEHulIROvJAUzwxD5APr0nlQdxDyyKnhQYr8n/DbXDgqvkj52HRWgy7g7SPvIpl73RG3b7xA2iVwRvsxjBqhSzhibkYJy1wWVYDbPJ8Wh6pm09fXHmmU26QNx1b2nQE++7k3G5QgdGHhzX7dS6BOO7XdwPfHSGywZNsgZ/WTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkBcJMHHPzkRtSjlHeC+XtKqMnG1OxgVB/A7DuHts5g=;
 b=xfh1fMA4h7WFFgewBFsWrCZ3HeVQ3qrj4wUmvAo/S9pKUINH4Ajec0a/0QdMw3fPmfCe/QUYOBHeAchM96NRXOys5nwBMkhRW2iqEGYm4fAru/BCw5d9XyQawPgPJYlv2oE8RGPOLSTZUeIU7+7VoPJ+aPPOHW1MlL6ttKL8LCc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3830.eurprd08.prod.outlook.com (2603:10a6:20b:80::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Wed, 30 Jun
 2021 18:01:44 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::5814:4d70:f7d9:a6c2]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::5814:4d70:f7d9:a6c2%3]) with mapi id 15.20.4242.023; Wed, 30 Jun 2021
 18:01:44 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] ci: Add meta-arm-autonomy to check-layers job
Date: Wed, 30 Jun 2021 19:01:37 +0100
Message-Id: <4f353aea85754b553fbe5f20ff4dfe151441cb39.1625074124.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <c3a19ee4782bf8049b74513852f77d5735f4b91b.1625074123.git.diego.sueiro@arm.com>
References: <c3a19ee4782bf8049b74513852f77d5735f4b91b.1625074123.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.53]
X-ClientProxiedBy: LO2P265CA0220.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::16) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.53) by LO2P265CA0220.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:b::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend Transport; Wed, 30 Jun 2021 18:01:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e124eeb6-1ae4-479e-dfce-08d93bf123dd
X-MS-TrafficTypeDiagnostic: AM6PR08MB3830:|PAXPR08MB6367:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB63677CFA1B4CC4E6250FD9CD92019@PAXPR08MB6367.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:296;OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 8B6doW5mpA+ESfV8TvQ2urvWlCIEyE9v9TVY6boddcRnLp0RTNGSS5sye0ypP0Ba2XXf0nx0rXRYcW9fF1loP87s6CgvabJZSGR2Lfx1P+s2q8CxS6dbushI7zXtJutRzqk7XIA/AwErE5ybyj/rZh9dvvQucdHZZs9y4zAFxUhhPcPxBnfNEpcT+7l7HeLOffItrHMrgz3V+H8Is6M0J9ffiWkskAjqrjvuVjd4MuyF8qe3LxcwyAiJKSvzbOUJXzscCmVriTn98D8JsFncq91r7ye6HLQ3Y+U09u++3z96PpAdDjGm47V3v4NPsYlwuPe3DV4AYraDIHB3ejaZ30uFZlgWsRPbfDPIlbTvoPDf7UMjihkHCvqOZcQ0QrFu0FxJQpetsTP8b7WFnZ6tkxNX/FoNkT+6yJYJ3U7S79DRotkNv60L8gzflnWhA6JqLQFdWTCTL9tgnXMyEQvi9UG+BfDIfr9VeGisO7Kg8l5xjTbph50YIanEHyiYeBaRNE6chY89g8BsLyfoZUHV9U2JH0tKaeBRLWTjZNpk5GzY/d3n8ukWzy1xx2/BdJ96qY4O4Pubv/iwo6j+/VQFsOFQr92qeVz7XPa52CSKpkjgITL7P2+DrT0LsTRbl3r1x2tg2p5dwE+0Y6bCuMCnJE5ZkJQ20BOUFlGzvf/nVpwcg0bilsfBgooAdX6ULUQJmYVnemaU1b+MVcuiFuRj9Tc8yr52bAL6OyQNOuHeLvDYV4LOZCtp4z+rStUz5C8ltodUx8K2y30EAsd0EN/M2Ijz+tOAP1kxL/4BChs1zhNx6C93bLeXTwjYcs6E5x3NMY3vvouwRkJGmaQ36wGLGw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(366004)(376002)(396003)(8936002)(316002)(4326008)(6916009)(7696005)(5660300002)(83380400001)(16526019)(186003)(8676002)(966005)(38350700002)(38100700002)(6666004)(26005)(6486002)(36756003)(2906002)(66556008)(66946007)(478600001)(52116002)(86362001)(66476007)(44832011)(2616005)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?tb2jj9uha6gIBqQaYj2tLl1ZseBoFigy1dPKIWp+r6R4PoxV0LjDYQE/Ruk+?=
 =?us-ascii?Q?kevebQSw60uBtGW2VDHHxLOgsnHAW54hoFlzLBIyQigs936OV7mqutAWqN6o?=
 =?us-ascii?Q?BuB+54Ew0b4V0JeBHtWrgC2q08ogaqmBop3Wmm301+tnNaA3okoIzDI4RVhi?=
 =?us-ascii?Q?muhdKkwdbLHfa/UTY8btn9CRwbuRkxV2ZyNJMDFrw0bbboJXmduRJhstFDVZ?=
 =?us-ascii?Q?ksc2h1zW+triKtxNbe7icZKVqUFvErtbNdvsMmGbaMOO5XeD+asL9kJj8lLi?=
 =?us-ascii?Q?otKgQirsSfqW6eFbdawzr9FBlka86uyXBT+KnACsSc9gbVs3NyH9TJ9RO5+Y?=
 =?us-ascii?Q?rxF/yB7s9YtyO29Yth/LctOkexGfCRvPaOgDIS3V0PvvcAcKRrDbsre4myNp?=
 =?us-ascii?Q?sja6cZhoAfch31uWy4VamU5M4y8clHUhy7lQhgEhVnrR8OVFYsFe/6MdithU?=
 =?us-ascii?Q?AsSzenGSE6iBBMCQa0lbJ4HVQbBCIHsaNY+/SEVDpNy6FbWPPcVI3QeF/9n/?=
 =?us-ascii?Q?xH9X6ZO2QXq1MqrcM+uq08/giJa725llmT21e3J3BB0CK38+ycsoKpbzrp8O?=
 =?us-ascii?Q?Ilz2j8QBlGBEz6I+cGkmhoR8Z4aPNaKczAaIoqD1jbMUBS13tgBvwY71uEhy?=
 =?us-ascii?Q?tPWkUtBMtpk8AysFO6QdarJIO6UgvUkCoyy227AMifF8TZLIPYfGQX7aKOA5?=
 =?us-ascii?Q?3LA4kvKqGXtudctcZfa0W54pfkrIbZeRxwld3zi6hMvLF4bk2vV9TqjHAGfR?=
 =?us-ascii?Q?ECRBN5GpN8mlic3xtpe1+IVzaoNlPis243d9855WverLsLHnaQTiWevGdJJt?=
 =?us-ascii?Q?FZjWC+oDQ3i5suFJx6AHtb9SLQgLgeNTaac6NqI0fSiyxzF5hJxNAq6Ck5V1?=
 =?us-ascii?Q?4vLvbiEYR13uMp3VqJsdFzGs1xz77Vbvlh77Gfh+fiaAyfHs4WysAAVz4ur5?=
 =?us-ascii?Q?jEvFwxQCEiImP5M16gtJi0EeqT6e3ZiM3o3xwedcWcP4cae20cknDrGfYHZC?=
 =?us-ascii?Q?N+dRzXYFu78pxfJodA5MB/71zJG5CE3OXTAY1zOwLSvoyngb+ipRVqMqnU04?=
 =?us-ascii?Q?djAVs3hmhBqiG5rKGExPaTXY+rQj9Dd7oxSzQtbvwqH4qL5yuBZrqoP1rxfK?=
 =?us-ascii?Q?laJRlNkh3cEOjd30Y5ECbIkIjgvEejb52cwSYVsQy8wjuRmWeDNRoF8BLZKO?=
 =?us-ascii?Q?iVPbj4NgkqZhnmx05FERWjo0LbnIKkKxOgG4qI8bHJexWIokau8Xh2Cd13Ey?=
 =?us-ascii?Q?SRfTzI63ewmdvqWwNe+IhibZXanTlfSYiqknemxt9Igv+sKet4tC5uQL22LK?=
 =?us-ascii?Q?rFwb/tnAlDG6zE7LjftmXo7S?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3830
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8ece8e10-acc6-46da-cac2-08d93bf11edd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dUTFjyCgpTj7oQaT54nAY30mR2UYvPyluvfQRTpKNVjYUXBggIesjd4yo440CImrJktu7Ah6JI5ixKbRJoeM9YcBJSW3mTjwFQ52oqP9ZrbMwLHXd9PnwVOyFU4vn6mCIa43sPG3h2kERDB6BtG/b8AbVrsmnKEiJVyHGHBkkSOJka76E6aasgdYzXvLRKWS5eDqPE4wJZM4X5zjon7NNkaHx1Mx9HqflEafC/8/FbXSM2yvmaC6XU9wLam9GuaDAMd8kVNlLU0gsh+2cBqdIDR4CdqbbIDgFFUFHNrUw5bU/zFQNee2pCywh4ucE0VBSTBuf9hkOBwXG2VK2KowdYCob5TbI7+NV2oB1nFfieSkhUJyNrlRjWNr8kO8jDqElL+aZpM39O6WvMNmhKi2yDSy00svInZqLLkYxYNFZiVxLs54U7yG2BFfvhgbBr4aBQeVB8XNdrwx4LM+q3pGtsxgHDW7b5aRwraBqt+8rUNxn+8PfQNA5zkXNvssbKjR7/C0T92klKJLXhoCt7Y8OLHr8Y9px7VOWD+MXcPGstz893EM8//X2iAG6wO4X9EBo0jp1/BHGaRGPGMbio23fgRoAfxZTdky92srRjQvJG/1CLC4D+fRl/cHq9wvvlIW990pToS3fucr3xjDr8luB+tYzQ9ymga3iNT+aaF756R1a6hF6f0YPf0jioOxekXvdS3npjiSNIEfGC9v/eAE8qYmP4AE+30o/d3Cd4EZoT9RpRkjRDoi3q8+foez1xd+ckuO/SD9Dwy02f57Y4vo8G5Bc69LQcwVi4hngyGXd3C2QLU8WiptgPVOG68QTtMGnw2XcQF93nPMNZBREafUEQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(376002)(396003)(36840700001)(46966006)(6486002)(82310400003)(81166007)(356005)(8676002)(478600001)(5660300002)(316002)(2616005)(26005)(83380400001)(4326008)(36860700001)(86362001)(956004)(336012)(2906002)(186003)(70586007)(70206006)(6666004)(36756003)(16526019)(44832011)(7696005)(47076005)(8936002)(6916009)(966005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 18:01:52.3896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e124eeb6-1ae4-479e-dfce-08d93bf123dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6367
Content-Type: text/plain

Issue-Id: SCM-2625
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: If6ea3b3ed2915d540eb30632e33bb29882a36b67
---
 .gitlab-ci.yml           |  2 +-
 ci/check-layers.yml      |  6 ++++++
 ci/meta-arm-autonomy.yml | 18 ++++++++++++++++++
 3 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 ci/meta-arm-autonomy.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 996b0ab..50eb88b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -98,7 +98,7 @@ check-layers:
   extends: .setup
   coverage: '/Coverage: \d+/'
   script:
-  - kas shell --update --force-checkout ci/base.yml:ci/meta-python.yml --command \
+  - kas shell --update --force-checkout ci/base.yml:ci/meta-arm-autonomy.yml:ci/meta-python.yml --command \
     "$CI_PROJECT_DIR/ci/check-layers.py $CI_PROJECT_DIR/ci/check-layers.yml $CI_PROJECT_DIR $KAS_WORK_DIR"
 
 corstone500:
diff --git a/ci/check-layers.yml b/ci/check-layers.yml
index 7d2820c..2383565 100644
--- a/ci/check-layers.yml
+++ b/ci/check-layers.yml
@@ -3,5 +3,11 @@ layers:
   - meta-arm-bsp
   - meta-arm-toolchain
   - meta-gem5
+  - meta-arm-autonomy
 dependencies:
   - meta-openembedded/meta-oe
+  - meta-openembedded/meta-networking
+  - meta-openembedded/meta-python
+  - meta-openembedded/meta-filesystems
+  - poky/meta-poky
+  - meta-virtualization
diff --git a/ci/meta-arm-autonomy.yml b/ci/meta-arm-autonomy.yml
new file mode 100644
index 0000000..f95642c
--- /dev/null
+++ b/ci/meta-arm-autonomy.yml
@@ -0,0 +1,18 @@
+header:
+  version: 9
+
+repos:
+  meta-openembedded:
+    url: https://git.openembedded.org/meta-openembedded
+    layers:
+      meta-oe:
+      meta-networking:
+      meta-python:
+      meta-filesystem:
+
+  meta-virtualization:
+    url: https://git.yoctoproject.org/git/meta-virtualization
+
+  meta-arm:
+    layers:
+      meta-arm-autonomy:
-- 
2.17.1

