Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574A4C021B2
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 01:34:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13677.1740101660193719249
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 17:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4147e42398=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KBu85a023364
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Feb 2025 17:34:19 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00ku5yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Feb 2025 17:34:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUQxPf3BGVsioni1AIXMDjg6pa0EwJM4DHAIv5+AgIykwLAQYJsCCrFvhH8gB4WsR7VyhPrP+fM42WSZvP250TcC1u2l2Io5OIQZF4741eGrz1k/+pe5q7lbhQnEtYhjtaCneYuYPMZ/C6c6m05RRGt4Zp3VBYjzWrrmswU86VBaW9zdQ9IwQ5nng9j6wTVxffYvsJ6k2/HxqzQUSW008aWOOk2NHfwXOHGbc3MghvU4qXaCG8xNSEisLmr1Tz3XNn73HvvQarww/bEAbiWSj6LXRsGfghIzfHPZ8P411QUroDuS/JOu2Gsi3xjlHzcXeAqBOEO07NNhOvMqJz8mKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJ3kCWRIziC/I4g1lF3MlcebjBFbzpPAyG68i8BvRS4=;
 b=BB/gv7oODacQ1Cszh1cP0vbpoI0RqG7f+blSeorEGmvrFocLqmhKKhSOkwXBAnTqgEd5CUJ3o/d0wH5K7ldbgdevSVHZ4A4eDVjrvmdoioP7R4AhKbBYWVAuxOYkCZItAJrgEo2KfMdpyExpMvhSfOlbKycHvtrRsSkUSaI7TxSeGetXD4zra1S18ItM+HOtgdVEzbPuUOGI3pvFuxXavRWaIxg5R76JeHp8Qlp6fsLqFkAuS+fIEwFkT0dKTQ4lrYyk1yhBx22uVJmFM0DQmDYFM5Pn2SKS+zAhiDwtXA05ZujJs5TdHO2KapMV7ysM4/w+Az9qTK1fEFRQ2+xKsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by MN6PR11MB8244.namprd11.prod.outlook.com (2603:10b6:208:470::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Fri, 21 Feb
 2025 01:34:03 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 01:34:03 +0000
From: haixiao.yan.cn@eng.windriver.com
To: meta-arm@lists.yoctoproject.org
Subject: [meta-arm][PATCH 1/1] optee-client: disable build on qemux86-64
Date: Fri, 21 Feb 2025 09:33:48 +0800
Message-Id: <20250221013348.2622293-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0095.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::35) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|MN6PR11MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ac3029-21e4-458d-3ff2-08dd5217d2a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kg+P6UtA4XVnJtTrPy7aZEOHd3S9/gFXSpZLZhFShBNzq8vYrrNetO759ffT?=
 =?us-ascii?Q?iww3Kf8R89HDWO95OimXDjie7dJp13NzZk/e3wMh34eirpi2qj3A+6XNGvg3?=
 =?us-ascii?Q?7t5utCSqoP9dxHOWvSkoSBjLCkYXxonn1g1+sIH1eUuRsPsKRTTH8k5NM+Re?=
 =?us-ascii?Q?xYSiVwU/JRYyO3wtKOZ/gE9sWLgsW8FL0DBrX0GRp0k1UCr/TLWZJCiTenKJ?=
 =?us-ascii?Q?zHIXx8mbMKXy2SDuzH4ciRVYl7TeO35PO116kL38KAhHTeDwTJNMlF6PUYsX?=
 =?us-ascii?Q?gYNvsdVqRkxJxt8mOd4yn+F4kj91D7/IIvhohYMRHFnUR4E8cQBD0XdjW1R4?=
 =?us-ascii?Q?8g8Z5pfSiPRGJ4jcYMMi83Rew9Slo5tyljc0SdK50vyPZbR7uYO25iNLW2xf?=
 =?us-ascii?Q?WFEJmclhIiVpSOEp8Li8sVBygH2/1hgTbg4FTlcCP16WTshGMRz7ZbuOjC+D?=
 =?us-ascii?Q?dvadp1WUwp+Z2rc1CpJN2FX45kKwetoMsPqZdYJsw9suNXNN5kvyY1eiI6go?=
 =?us-ascii?Q?TmdZ0COIyeXFAcwjjcccuKaI0I/RP99FS1xgawfJQ1ekp0EvpzxKWbywTJ96?=
 =?us-ascii?Q?A3cW//P86uoVL3LmW5mlrPLiaSWNgfKgvn7CfVSBYrIxhQMZfjiUF4EJkCAv?=
 =?us-ascii?Q?mhXkdiPsnZzIQPgJ1+FFMBBJpEw1X3/WydeZ5DSJiOsPa88HTQ9o/t68qIUb?=
 =?us-ascii?Q?6Dx/nwkG7FCnkZ5hHSpGH/aqcvFCqvwSciLETzD/ZFQrVE0FzEM/EC4IiXMs?=
 =?us-ascii?Q?Y79LR0/1bp7Egkv5YAhrTVDzw1PiwNofizT487LKUoroJYl3+nePZlTVcmkG?=
 =?us-ascii?Q?RsX99Vwej5/y96dzJ62S/oDwf4glx8YwuBQKD2zAgP4jnl32RglWR0atlPht?=
 =?us-ascii?Q?PVj1tUkdHppW0Aa48IaVYpAsNi7WmFJ8j+cdCaCXEJ9m1TNnWtWGdQDQ9IEx?=
 =?us-ascii?Q?z6vG1TR1rTYX57rdDqu9ce7nkyfZ6A1kofXrKBqXRnNgprIvQeSsrt1Oh9ET?=
 =?us-ascii?Q?l7qAzp5h2xQw7xWRO2Pvi5gFkUFySoHd/DEm+/PeX6Dw7iSYOA88iGm18AG1?=
 =?us-ascii?Q?/XI58bIOnByO/2PQhsXhQzsIYLjPiXL2XLTZqn7V9ZlO81wDMrE67XfANHG+?=
 =?us-ascii?Q?Qtu2IvCt+4BrDr6s35ilWlHQrXzlDF0VT14pxZrx6QFhdKDb6+CFKGg3sC6g?=
 =?us-ascii?Q?7dKVTpUb7tOXEwQj7KaZv+0pdn5lhJdOo3n1lcLCcxN5fN/0AQGgPYWH14a9?=
 =?us-ascii?Q?Rht0v1y0usB/m7z6fX/5gWo0jHAj3QFWQ+u7dFQvFAL1SC8sdBmJTbdwvDy2?=
 =?us-ascii?Q?DrsNh1OlS50Bv2YgqXCtXzGeR62LepE/z9NIcWSBGLvEHL8rJjAi+ThLEXLo?=
 =?us-ascii?Q?SUCA1ipgnUlpY1OYPmjpP0r3AeMFLbPJj0a5NRR8mMieseBQcGS2hMIKwrtn?=
 =?us-ascii?Q?R+bzJECFZ6Sskyoi4Byp9t1aimjgfZAd?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SSao/l7irhiXlTzsRYIVjk0keHTEHknVkGYrGczoRVGZiWGzRIlX8LGlGcDm?=
 =?us-ascii?Q?yPizy7KG9YuWhs3NnuKIJpcjhpQgLWkjoOOfegxrr85s6WV9Kg4KKVqCj85H?=
 =?us-ascii?Q?VbT0zbAYumybY22xAMjE8w/F26YztPD+B0Ot34r5Cg9a3gX/qFFsa7mk1pLI?=
 =?us-ascii?Q?d8nfCpFwul33VhEULyumjbD/SkDryZrMalhwTgYPOSVZW/1VTISgS+sNYykX?=
 =?us-ascii?Q?tKvplOfN1BRvr4oS/2JKtqLtDqoicxE3cAr9YHSMFqsUs5DO8m8phBWUnra+?=
 =?us-ascii?Q?jf0KA+jML54UlywFZv3Ie/XI3c94pn5OIQHY5DXpI5epF057K/G07Hr/17db?=
 =?us-ascii?Q?cpvIfx5TqJ5rRftb8Mq+8D7Wt9lkGAqxZbomVzgN1vn87mXDZ1LE/49DRI8H?=
 =?us-ascii?Q?/8iAOJ4DQaX+ynlwIKtgwAIwWdSlDmgLl24M6YOUblyRw3lIlhr4/5jB5ZCG?=
 =?us-ascii?Q?IZoe8m7W1XnQZ8p7LkByrWrrdAuXeZLVRHcntJdH0ch0rYRX+pA8OlkQCjOH?=
 =?us-ascii?Q?QnO7ygfXJqR+C/HB79TQyceDbtJXbt9pyRGwHZC+F67mEqmyj6lQsRmQz+mg?=
 =?us-ascii?Q?HVyu+d1QbQv5zai0YP7jyCXncacANxsy9JT3cYhars47yC5lRmMQTveK8IHo?=
 =?us-ascii?Q?ImLYgpsUBwHKgyNMYbnaTFpr3BydABrNHanenDJnwes6DzX6EEmYWe8LV2DI?=
 =?us-ascii?Q?dDsAR1i1MEOIFrqiVoGka0iFGtnKrH65LbE98FOdggwtkXdcTplL27WM22oD?=
 =?us-ascii?Q?L2Ng/lfv1tskkEdiHEl5At3weVHOMcSt64z23sZ2Ht7Gfc1tZJshIV96mRox?=
 =?us-ascii?Q?dTqxXUsOV+7j+BDbdK8xl7VdUL2I+rfl5MdQ9Q+xido3WCbCYaLzW6VS83/V?=
 =?us-ascii?Q?0+yagLgsVLTV8r8YXhrgl3QkeBIe/SphN4AsRqxnKlYtWrqS31miqTPHWeI+?=
 =?us-ascii?Q?LC0QjQS2VXCBm64Pyw/xAEfQO1vDFzrCd8X8zDkVSaWRBUYbqYHcvFaABWjz?=
 =?us-ascii?Q?08/et3DpGL4cnMVgcWIhQ3EnKtRgaR3QErO8Vpc6HpPKyY+zUWNuw9uGhqup?=
 =?us-ascii?Q?8t7wpjb60J4rcDmVPA+s+EdsqPl8yHZCkB2QXHZ7rK4/oNYeeMlKUfKQRIiv?=
 =?us-ascii?Q?P2jWm5dC89vbkxKClXE5A9YieNR+lFGtKLQJ30MD5IRtRuix6/f/pOqqSZkn?=
 =?us-ascii?Q?iYD0omZshyDamkzR5Mcgki6qnjR6e2x/rk3eqtay0CgfpBXekn5Ej7n+Eif/?=
 =?us-ascii?Q?tBB/cYJp20OOXby9YhyFzaX11CwncVA1hJF82spbuDny7lu2h+A1X+Ao+HVR?=
 =?us-ascii?Q?p/y9aCvnqpXZ6JdjKjrpHaXOmFK8V0brdz4Ik6oKNBNtZ66V3vdGHyoPfhhp?=
 =?us-ascii?Q?uAAOOyHVPczQeHBd/afBkrkzCLg+pl8pM/PK0WixpYc4gIctXCSYXnG0mH8T?=
 =?us-ascii?Q?PR4d8D02wPTwTXld9r1jOQwJClEoIFP/cPveLN1bXuULqhlSXWWhxdl2aNQF?=
 =?us-ascii?Q?ITHV4y3mGM8GLGf6AYRFQZjc7RZVq09/PFWU0TbibivfYkx54GAB88KMRfbZ?=
 =?us-ascii?Q?1UfgHL+o2/xEYS6qLHf3TCUzbNLtkhhk0YQikm5fUevTk+eBMLj5oKt3+N9d?=
 =?us-ascii?Q?vw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ac3029-21e4-458d-3ff2-08dd5217d2a9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 01:34:03.2133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+9suXUGcnRkPYbHX65FsgMI/6K+s66LaSCrQQEz24oiPis7rfHoT+KEouY0KGmM453LUSR3e3OhELD85udqKOiTRGi85nTPYjzTvbLuk6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8244
X-Proofpoint-GUID: vsHZR3FiZ9v2Jt2Ib6dix4TbA4BDBs7m
X-Proofpoint-ORIG-GUID: vsHZR3FiZ9v2Jt2Ib6dix4TbA4BDBs7m
X-Authority-Analysis: v=2.4 cv=Ao8U3P9P c=1 sm=1 tr=0 ts=67b7d81b cx=c_pps a=19K1aDEwnJ0RahI1emVHDw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=4pPTPKVr4uQzu81tvjQA:9 a=ZXulRonScM0A:10 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxlogscore=559 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502210009
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Feb 2025 01:34:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6376

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

optee-client will be built on qemux86-64, there is no OP-TEE supplicant
device on this platform.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 meta-arm/recipes-security/optee/optee-client.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
index f387c80574b0..aafb1efcf726 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -6,6 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=69663ab153298557a59c67a60a743e5b"
 
 inherit systemd update-rc.d cmake useradd
+require optee.inc
 
 SRC_URI = " \
     git://github.com/OP-TEE/optee_client.git;branch=master;protocol=https \
-- 
2.34.1


