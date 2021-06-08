Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.57])
 by mx.groups.io with SMTP id smtpd.web11.8836.1623250136107348558
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 07:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=uwttkCkA;
 spf=pass (domain: arm.com, ip: 40.107.8.57, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAe1HsqcWlcGxp4Vpd0h8B2pEqkLdwdUla2IcSlqAbI=;
 b=uwttkCkAinRdUlw2a1gBQvx70hsLJj6MBs2B1ik2s5jG3L1nlNo+hgAEYtkudrCzpR0RgaqlaJ8RM0znwowXuPJElK4LRCRffXe2f6ZZEqwwIEaq3H+sBBA7CwqohgfBuRTA12aDp7L6xqXBit2J6hDkAI+l+YA6TokkCQurrfY=
Received: from DB8PR04CA0006.eurprd04.prod.outlook.com (2603:10a6:10:110::16)
 by AM4PR08MB2820.eurprd08.prod.outlook.com (2603:10a6:205:d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Wed, 9 Jun
 2021 14:48:53 +0000
Received: from DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::98) by DB8PR04CA0006.outlook.office365.com
 (2603:10a6:10:110::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Wed, 9 Jun 2021 14:48:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT063.mail.protection.outlook.com (10.152.20.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Wed, 9 Jun 2021 14:48:53 +0000
Received: ("Tessian outbound a5ae8c02e74f:v93"); Wed, 09 Jun 2021 14:48:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 618b772eb8b4a66e
X-CR-MTA-TID: 64aa7808
Received: from 0e414a139443.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C1695387-E088-4A50-9BD3-FC698BA901A0.1;
	Tue, 08 Jun 2021 15:19:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0e414a139443.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Jun 2021 15:19:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N35bAwZ8IjK+7H4ku9a23lAQAYIjzKOAWbT7fg8KY7ON3Ia8h6E36XjTi5ZAlRHZow0iQtqMIBKRrCMhldTwKtaM8Qv/MFnp8N/AfZiYlfZLOcvOFYu1JYoPPvAS4/CeTChVhNtgYkXBUSRZWeRrVi4C3EwEFMCW9hvLX1kNdAj0h9CmwHW/9CC+j6VMXOH2wR7V6QJ2NSpOysnkYpOTVOQhBF2VqWmbJDqKyaZodE8e94bNgargh7KEws4JxZI6hsFUlnZ4IDDaND+TOn0rKgLcvL2cJuq/4Tx/zIeXBJFfPTiN4YLj3Z4XH/fIj7POBINd0zsOsyoXXB+PeBC+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAe1HsqcWlcGxp4Vpd0h8B2pEqkLdwdUla2IcSlqAbI=;
 b=LTZMAo4mDNbONw3oHDMhzDOGePbXoQApxi8XSFW7LypOsbWlWyEyAa04pYqLYG/dElzFHzyCnsW4vrD4WgUlRTgM74uMhoDcuhnDsk7boY6/miRbcDAG0zhOj+6vbKMgKSblfyRivbJ0W2BVo2r4EcRWB1DfyjjhrkPPAA12+iYQugssfFaYavAFJK48ud0BgaI+gptYn1XZxuqwnK6cxRj0M37C04FKqW/OUnfG7GNBE3vUOh4qrpxBlbfSt2WD5GxE7QLq+tgPcspsgj1rdmPYZUgpscshMjbpz7gfbJy+/7cj0y+tp15aXCfxY+IdF09WBrTtbKSpso971Y1ThA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAe1HsqcWlcGxp4Vpd0h8B2pEqkLdwdUla2IcSlqAbI=;
 b=uwttkCkAinRdUlw2a1gBQvx70hsLJj6MBs2B1ik2s5jG3L1nlNo+hgAEYtkudrCzpR0RgaqlaJ8RM0znwowXuPJElK4LRCRffXe2f6ZZEqwwIEaq3H+sBBA7CwqohgfBuRTA12aDp7L6xqXBit2J6hDkAI+l+YA6TokkCQurrfY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB6PR0802MB2568.eurprd08.prod.outlook.com (2603:10a6:4:9f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21; Tue, 8 Jun
 2021 15:19:21 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::c9d9:27e1:b9f5:cd66]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::c9d9:27e1:b9f5:cd66%3]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 15:19:21 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] ci: clean regularly to reduce size
Date: Tue,  8 Jun 2021 11:19:14 -0400
Message-Id: <20210608151914.15390-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-ClientProxiedBy: SA0PR11CA0206.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::31) To DBAPR08MB5798.eurprd08.prod.outlook.com
 (2603:10a6:10:1a6::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by SA0PR11CA0206.namprd11.prod.outlook.com (2603:10b6:806:1bc::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Tue, 8 Jun 2021 15:19:18 +0000
Received: by vm (sSMTP sendmail emulation); Tue, 08 Jun 2021 11:19:14 -0400
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36096e31-ca0a-4288-2dab-08d92b55b3ae
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2568:|AM4PR08MB2820:
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB2820980E45149BB9A415AD00F0369@AM4PR08MB2820.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 76LMY2jZHypnrNyVCJUPcSisjzDGwdtbmnPvsO9FBP4qkIegkEeJddj30CWYTD5zzPdeV6kNqGSI+vVlP99Rgbl5sY60ZeEOuYT2z6i2UHMQVU2AxIqbGlGys6PHtPVoJ4LYfVPsWgAp6KcdGl5huNmGX+xTOfsV7br8gm6PBKwvA2+aK6zaxA/CI97zuLeHT8KoLkyMDbJQZhpLyjYdxzjTOt6r9loNX9/5VcYLhYPNceFzFTVcCnzu9ZiSQB9NULoEZu1bsen94Pk2D7dVgwRbKjknsb4jEpPu0seViProMVILZawMT6HlkuW7Uq5JxWGXxgJsTi8KK/ZX3IBsdSVr10VZg69g3LdjCclFaNEKHFkiYhXanQ803vNdsvj2MOq6yNEkktDpACcQBwxRcNfmJIRhRXfy/AiX5I0ItRTgY+nKPVcSKxRQspvyE6MiRLuG11K8cYbUldSrM9z6YvMwLy/ACeNJ2hn5m4yIN/irNeFtlYS25An/DMXC/fFLXvYwCb/y2GSsTAMKILQNR+h0RMusYMWDRq6YuoXsviQ1Kwps03NSdFZAG6T0Kd4S0vtdUDLSCBsfyOZud3ygv24ilLITgaPAmumvQjtp2CdZbuuzn5kk5JecY3hd9QJPKzIbGJafYkVsxNdN+Vqxfw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(366004)(39850400004)(346002)(478600001)(36756003)(66556008)(2906002)(2616005)(66946007)(186003)(6916009)(8936002)(66476007)(38100700002)(86362001)(38350700002)(8676002)(4744005)(52116002)(316002)(44832011)(426003)(26005)(42186006)(5660300002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?QlCsApC0ZIZ+UZeJUJJuul7r3PzcdlcOCVPW31mQ+zoXJ+Kl/XEzgFbS7ui3?=
 =?us-ascii?Q?1G/zzUuk4lPW0HZlh9fvi/vuWhclzkaLWvffnKZZ90FICHpSGNDSq3BnHPoQ?=
 =?us-ascii?Q?OJGRvJhnLGRCzaNNcFclyEpwK+kRnH13sh7qlJ7SR/5s8ilJ+9hgpRxN2j4R?=
 =?us-ascii?Q?6j6okLFgu0Xn+eGUuLdrrv+PmrZqn0gD0o7fxwCoKcRoeR6IO2ez5FWNqDR6?=
 =?us-ascii?Q?KnyhCmrHiZXqZDV7NCeKQncyCpQ96kzbB511gXf8dwlY7Z4Cum7riC2sY2tq?=
 =?us-ascii?Q?s9gCYZeEBO1NtltousDiq9E7FMpaDjh5zoLigVojfW8zubFmiCmVcJib3hSy?=
 =?us-ascii?Q?fSIG4f/WUCIA1OyOeDbExqv/Thtf58KuFGO5iiJvnZG1QC/gclN5OYa4vm0+?=
 =?us-ascii?Q?Ol55G56mizomdesm0977+FkwpqfdEQRXJmxiYzCRVHh8372S7aPnLrwNVYKQ?=
 =?us-ascii?Q?GF6k1RrD/UCeu8Izhfbb5l0wypyhuWL0Qx4OHlWBK2GAVDS+052H733xql7R?=
 =?us-ascii?Q?EB2P4vPUT/6GVis+gcL5+d+p36//LaffRZRnt4/YBlT/oIMPjw2dp9UqsPOO?=
 =?us-ascii?Q?QpDm2qOLtNZ2hCN6bvDsX9xms/Q2XswI5yfSsU8mGnP3Th8f5KqIJKloQIY1?=
 =?us-ascii?Q?u0KQ3AC3/TqgjPVpQDI1A1GshdvhJ+Aeq5BCQmyvdIDW0AL9WWomtguwsref?=
 =?us-ascii?Q?/UMS/aiDKQ95gc2Spgp77lp3AaX90h6oSrU+aiaDCnOW2S+RO/djKznJGpks?=
 =?us-ascii?Q?0GBeEUlJsCcPticLbqmJQhVpfeEQ57sZgomsJwlDo90HeptzKfiDsYU++/Yx?=
 =?us-ascii?Q?ionyiRGtjp8A0SpanjFsg/Uqq6CuhxiG20pYdO3X7DiB2YelpKhDT36zsqXY?=
 =?us-ascii?Q?rycU7xaarSY0iq0VYB1DViLyxSWovbY7SRFwyfNSxlLO6wchqA7FL5BMPkZG?=
 =?us-ascii?Q?ICTyh4aaeam1b+fh5w7iGQlaPaGayj98nHAKvBEE/emBTCVw05ZyPjHfE3p3?=
 =?us-ascii?Q?aiQbz/SBMhMNC2dbTUcmcTJNnljJeWlOKXvTRVyzq04VCnulBIs9IHnCEHbj?=
 =?us-ascii?Q?Tm5KOMnod/wPJOeIzL/hviFG2KaPS2/YW0uZfNYS3EKDJUaYRK+aTUgvAK7X?=
 =?us-ascii?Q?1o+yZMWq+sUk7FW/IYwUIx4seIxAvsVtC0HthjhuV50kHvQhIVlnmSjmXMTU?=
 =?us-ascii?Q?G3V6+HGi7GVwMKAX0rbENMxSL1U9d5pXrzer5yNCjpt8fZtCcQvgxQzC2xsg?=
 =?us-ascii?Q?vRKc3mnwprGths9bBVzRWCguFoWPFMq/Q1EOofq7kIzVNEff6OyAILz3Nr3W?=
 =?us-ascii?Q?XGhWJRGClLWqaQlCpHr/ie4O?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2568
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b48d0084-d526-4fa2-5e47-08d92a90c9bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n+jGgCKa8ipZ2oTLR9k6Q/W3wPESe8o3+vhs6zvNWcHmd+zxMcu5e8IqE51lOkRxKYYoAM+NTUa52WiG5KZtgZ+HRJnP4N+TuPI6mKvkHzrcAvM2hRnXnv2y+7698sS8Cgmn4B5XRbu6leoCDC3Qixx1aCBGjJRF17Vm/n4qZhfqBcgz5whTygCp4921GPp3xMqNQnTIzs9uyEcyTwYUgSGNH7SfQYn2UTQhmTMN6AkG6zHeU92DkAzwIjuCNL7TEjUrQRYMIxftvACcoXElcBC9qqXcOrZ2kzPGVuYjan8MLtRN2SnHuJ4+YVVE5JBYhwHfgWwBCl+pnhqsH3wTV5JjndbtteQmY3JhSW8i0jLZDrc88+TNIgjlkm9DynhHv1NtIZYoi0S6xjJI91xXFeXG2SOvtXSa4cqZxrcqFFkgz1WqSDCHfShGG3i0w68D0q+dW53UJM+vRhWpmoezzd9WnLJZ9B09JoMIVHuSKO7ph7Ig8P4reTdtvKp02amzluRRyTiIJl+80hDih3QXpPMmGN+iUl9AI5vvd2QG9vCIDHFsK1usSe8GLlm2zUV2srTPbQMR8m4W+ruimcziiphuYSmrUCjCMlzHwuIYbNV42kLN65hzWQZLhpV3B+eOQU7U4FsMFWG3tIBIox8puA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(376002)(136003)(46966006)(36840700001)(82740400003)(70206006)(36860700001)(2906002)(4744005)(356005)(86362001)(8676002)(47076005)(316002)(2616005)(70586007)(26005)(8936002)(82310400003)(6916009)(81166007)(478600001)(426003)(44832011)(336012)(5660300002)(42186006)(186003)(36756003)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 14:48:53.6297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36096e31-ca0a-4288-2dab-08d92b55b3ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2820
Content-Type: text/plain

The Gitlab CI executors do not clean-up after each run, which will
result in a ballooning size over time. Remove all files in the work
tree, removing the problem.  SSTATE should prevent this from causing
any performance by not having the files there.

Change-Id: I57df3cf470c519286fe194739a0a7722794f3b25
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 834e16b..b18373e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -20,6 +20,7 @@ stages:
     - echo KAS_WORK_DIR = $KAS_WORK_DIR
     - echo SSTATE_DIR = $SSTATE_DIR
     - echo DL_DIR = $DL_DIR
+    - rm -rf $KAS_WORK_DIR
     - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_DIR $DL_DIR $TOOLCHAIN_DIR
 
 # Generalised fragment to do a Kas build
-- 
2.17.1

