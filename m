Return-Path: <colin.foster@in-advantage.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C9FF31E3D
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:36:58 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.131387.1775739007013616428
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Apr 2026 05:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@in-advantage.com header.s=selector1 header.b=j3aB3p+L;
 spf=pass (domain: in-advantage.com, ip: 52.101.201.84, mailfrom: colin.foster@in-advantage.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLpuA4c9suQ1ReY6g0LWfhGXtRxt1ndeSBpan5ZHuyUXJ0Tvkuj16FTgFK8tDQJTDTjNcUU6oL4k0CDr5OJ+yxUzF+FKZ6P45swMM2DuFElBCxyp1wmVnBmTdsgN4O+4jUVOH+Z2OKLVYy7xZ/OmdoOyAOnzJ6V6IIQT68HxkaXm8OHXd3TgJ1Bay4L9nZQ5kMRICKWTAWAumF9IXQSXWEbA/oproD7fYg91vDQXRiL9gd3DFl4jdWHuqPHAoGyB/kCCQgGDJPStZlSvWP3aN7YdDjjnsMSIyXLiEGRtoKJKkh9eJaDtulmdXdNd3l0MrRMi7Fc5VMb3bLQXMZ1O5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmlhEikDdmj8cT9wE05RCl+CLqBC5gc+TlLahtI10Tc=;
 b=M0wUquIE4IC4CoYAARq0yq+ineU4BZ3IriA4gZop7X/X21zHa1NCgzprjC1i+9L7f7COWSLSQbNpKCV55u/o3SateqtebT026aAemL53s5uq8QM/ZHB/hvw2sarCOf6Pes6+y46tazmtLY1m2tDiT+qd0ElFoAFUsrvpQzKGkla9POIOgAOv5N45Ww5ePr+9U+8a1rubIZ/BDnjx+sBzldFoyPzg4sFhhbLFoyaUxJdXFWrBspA9Qfm6mJbHKVbBSNqWhGL4oYzNXy3UvRwXDIIFOdx68HS3sM/+UkFVYAt6qkthfcaiKqtZqrwFoiy7fvUyAjXKKwkG42haemsDtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=in-advantage.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmlhEikDdmj8cT9wE05RCl+CLqBC5gc+TlLahtI10Tc=;
 b=j3aB3p+LIoeDTGIHGEJBwdBUEfVXKg2FkBnnF/HZ80IkHNxYcOCfvfDipKYliABatGWxeeIbS8i/PkgRxKzIfvltr0xZhKaDCcyyPPEAAth2zcfnmwRT5o1w0LI4c+VdfccTvxzh2cVk5lk52TOwkc1IXZCbQDonvt4JtsQEXLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from DS4PPF3984739DB.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d15) by PH7PR10MB6353.namprd10.prod.outlook.com
 (2603:10b6:510:1b4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 12:50:03 +0000
Received: from DS4PPF3984739DB.namprd10.prod.outlook.com
 ([fe80::14cb:9d8b:4c6e:6f3d]) by DS4PPF3984739DB.namprd10.prod.outlook.com
 ([fe80::14cb:9d8b:4c6e:6f3d%4]) with mapi id 15.20.9745.025; Thu, 9 Apr 2026
 12:50:02 +0000
Date: Thu, 9 Apr 2026 07:50:00 -0500
From: Colin Foster <colin.foster@in-advantage.com>
To: meta-arm@lists.yoctoproject.org
Subject: Git repo down?
Message-ID: <adegeIztCtiLd_CA@colin-ia-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: CH0PR04CA0089.namprd04.prod.outlook.com
 (2603:10b6:610:74::34) To DS4PPF3984739DB.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF3984739DB:EE_|PH7PR10MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f7cf506-1872-4d87-c147-08de96368418
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|55112099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	LoHiUpZhYWrWTqzmBPmH6h/v5g8cnuuGuijNRTmx4Bn5LZy+yoOrANEUNa6UMI8LOB0gnlcNdsiDBuTCVqbR+nPzpOSlMGN/dxLujZfPNANt37x25CXTKEuMklGimn93ZqOCzQoX42n6wbdiV0ccz6h07akT19UeLAEosOY6ox5MpPzdENCylBzWuetEwaxKKw74lBy6FoELI1uqcaSilQy7wYnm0t//GGTfQW4ND89BxPJ5ihVCL95AsAboMyGcaiVJfhHTHgaiQe99Bid0VfWliXJgktiYTXogSkkJq49XMMtHQazeA5Y42mZUo/CWncsT412yNp5i+xYUSj7++PDm4hbQieL9DBg09iPP5gOgp+b4crjJcpB5SF/SUKe/P1O9XjR6/2Vw4i50pidV/gAzlgyHfwFFNBMWgfL2+2Cfp+/mVWaL1grg/UB39yx/cv1LlhqGmg/JysEBzuuTf3wGhsIW2+yxdLLAcIlvoPyj3Oqg6zEE4uG804uIOurmUMuz8+alkm8aCJdVblx0poN1JXsdFkfhArI/GNdnFoUjngcvEmpYx/FLDk9f7p6fqBukDqEynz09xi8WAxsHGuVKqf08K70fct2Gx3H0SOwrHvA5pzDJuR71etxIoC609M3Fd/z6zJS5CXKBywPnhSuIXQvn1TYYJ6nl6EsYDYSznKDbK/iLqTLi9nHrSdHO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF3984739DB.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(55112099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9ZO6rkPPpvnMIIO8YpP5pYZcgqRh4J7dz3gnBWuLpSllGbcIVWqrw2OuaidE?=
 =?us-ascii?Q?oWhna5rXSINdb5saNMtoQhfELQoUoB9hHX6+o3iIix0PJsXif4TXOgt63gzY?=
 =?us-ascii?Q?ZwNsPU9GOIkY6k3DwrCx5kXRRLWuZayBxzi/YwufKvXLZyJePH7cLCB3BYbT?=
 =?us-ascii?Q?1zbOpoKYkypeLLjgHM6QvwKdW7tPar75J3Xc8J8qKLQUvCBDXVvAImz7DsfM?=
 =?us-ascii?Q?VrE2sNEYWCwd2Zue6IW8D89toCAGvd7D6Oek3gT9KHzKeYnr11vba0BXdquK?=
 =?us-ascii?Q?LwwfSmzJcIWhLgSajNu77xgMSc09fThPraC20WDX/QlanjDIpryJhjMf44CN?=
 =?us-ascii?Q?102E0j8j67c6YTDlhLZQqOkP+Ji2Sk8uIHk8WywtD4R7zh8DVkIZkbQxY/xn?=
 =?us-ascii?Q?s+Uq/P4+/VBuAHWoWyi+9SdyxWGRLCAxqrfCTrxEOWmW++u2LlQBprTodIKY?=
 =?us-ascii?Q?2AuaH/XiJs5mrjxqDAs0lFe3eeUwbw22+FMwCrLJgMeK45aPoyCuildNgJCf?=
 =?us-ascii?Q?LpjKCiV6hJSQxQaZsiOWeZyytE+UXt8s9pT1kPt/Xo1qTj7GviW1DS6hXy3L?=
 =?us-ascii?Q?57m+/cgcqLlAAFLwpI3p52+UFbLWvA+2VcxZHRFZqHxS7F9AXHY5NrU3VO38?=
 =?us-ascii?Q?iedUgb7+zkVtgCj6PBHAstB4YGgiwnW5jye1tMTVKVJlQOaJ99w5lECD4eIe?=
 =?us-ascii?Q?N8ZdKBWOBCboyWKfpuPYrM5cpJJTHAW1ULyAokjY0w9V5w8hsIlrTHHz9UeV?=
 =?us-ascii?Q?iphFjTbrb1Tc30OsAjH1XINRiy3q41dAVASxf47YtpeEZDUOk9lBMDpLpper?=
 =?us-ascii?Q?4gXSJic7oqIjpT+e8Xmlc2YrPMezilhtiUfqZ9XkFuhvOCY8+A4H75Q2FhhQ?=
 =?us-ascii?Q?3gcVrJ4x63ITQyinXGVd2fAW+8M47H2o/6zOcRIRcMda1b5ICyROboMg7V12?=
 =?us-ascii?Q?RtbVj4xmyuKXlyjesv1LejFW3M5vZCwwPHsIr/D9ewCrQR8ZQWDY5/nwaSrw?=
 =?us-ascii?Q?e5S/guRAodrTFj2nE01q3NN7InfmnzEMnednQztoNIG9It47kfxujrR3f5Ge?=
 =?us-ascii?Q?Fqf6LxteaYybLv2T8gdC2kYw1OV5+ZgO+FSxP83lfO9iKGb6bry5KQhuRU+9?=
 =?us-ascii?Q?yOXm4EMhY70BsYtHjzH4XbCG0kPuJR0YfDDiIog6iwfq7MdUmBD14qtXPInX?=
 =?us-ascii?Q?SflBKfGQRE2Ck9S3yiN21Bkwlaq8r/m9Il/Go9ltnIPktAf0z1FS212b1qUb?=
 =?us-ascii?Q?HGjcyZAsQ/BpuMZkI9Fn59bscUwc6T751GfdXHH/lgWNfK5JcusPUtH/RuLH?=
 =?us-ascii?Q?Z4VGuvfkAVBkm667irxTbZEaBPGXew6mLrrAdiTry2fIq47aAP+10shSQudl?=
 =?us-ascii?Q?v6Z1Wap8V/pG0RN/xG2ZEEec0lXQ09rdCbBfaQmKsZ1v5NUp+NK5KQvoHSG1?=
 =?us-ascii?Q?9jXSsf/6R20ELjTtR0e6vAK2bHTjcU8CINPEyPbJbky23sX6w72w0dJithP+?=
 =?us-ascii?Q?P4miRMBmZxgSuBJWX7gEJ873+mIlKpKjBmfKRiiqYpJo6LKMw5Gj/L/dVjUd?=
 =?us-ascii?Q?hLLTjcW7a5sn9v40nU0Wnz5PiksiK6IlFXCNntinwDn+L5h8JcXFragCd+C/?=
 =?us-ascii?Q?99RJM36nLVCJqegHt28YnHl0PRQYRFgx+K02PLjte5cHNg7YuqtwNqc7bum0?=
 =?us-ascii?Q?oj1NlyS5+ejD/8tjQ3HMRg7tgmv6b9C1DGU4Ii/7kfrYRsGiO/JhbZeXKY2l?=
 =?us-ascii?Q?Jo/RZG1KA9WHGRPRFwqsNajAUguQilc=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7cf506-1872-4d87-c147-08de96368418
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF3984739DB.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 12:50:02.5852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRH3ZZblxyWqXUTFyOO24XyK95Vb1G2GGIsQ1uaZCIuMAk+78tym3TbiWPDF6ubNFPfFxXFvwNQ/xMldq/ZqVnW/ubZ/xPzAGplCyHtgUQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6353
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Apr 2026 15:36:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7009

Hello,

I'm curious if it is known that the git repos seem to be down. Both of
the following links seem to fail.

http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm
http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm?h=master

They were linked here:

https://layers.openembedded.org/layerindex/branch/master/layer/meta-arm/

Is there a public mirror available?

Thanks for any info!

Colin Foster

