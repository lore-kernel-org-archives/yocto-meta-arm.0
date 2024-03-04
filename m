Return-Path: <meng.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E7BC48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 03:55:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.90674.1709524546353805161
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 03 Mar 2024 19:55:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GRW4tNsU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3793e94f73=meng.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4243qMPI014195
	for <meta-arm@lists.yoctoproject.org>; Sun, 3 Mar 2024 19:55:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=ESKIS5g9lHnIrW1Exq
	chhPjouww1EYtnkyG6EwKy0dI=; b=GRW4tNsUYn6LIjVF1ZPWQ9S+X9zeqDDpD0
	rq0TIec+MDKTLfcU8fuFspIcCnPqtIVzT97xPf/wl6ZKaKt3i6SRQZgs4qAnhHHl
	3NQFUBdn/Khw55TbzteNbKc9adOSnN3LdDV2lTJkqegpcEsVO80H5EBoQBT1860H
	hnaIS//PPPwTXn88r0oH4oKlrNW7fyD7mz181pp58dwdEmG1eXwtpq/kmG/9RxXT
	lainFjhfvwVkFS59X8btB0/+ZxHFMDkvxJLxsRlG+H2oSQSSmEOSXEecaPfNKqEW
	ox7ad0wIk6Ea/FowT9OKaCsu5n39ZdGSAb4vHjIm73VtokcmeraQ==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm4gm12fe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-arm@lists.yoctoproject.org>; Sun, 03 Mar 2024 19:55:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hl4//4XCw2P6vEfjESF24zSDHyzwugqlKdsruqLaSesFJCIp/p8pRsavK1yMes9Or/Rg2Q3qG0JKWJOjb6o6nbD0xx4KyaO88P7dn1tbIPYsX4uAs8ABjEml3OQdfuRlKti/2173+Wqr/vx6HqUqR6+8vnjbAAEq3imRkXMt5V7hjGipc8J9NSPV+egW9yvF73jPtnwI0WMWNHfh2ih9nuqB9X1brs5P9TyDoxheMIGZ1ZZ5EhNMJpkQlwtxPR6mi+DmnV66f7m5YVb5Wr0XCh5tjUywAdlrBHXPUsUL4kFF4662GR6MHYCb8+uzWPD/mODYkGzTwkS05D4GaW63Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESKIS5g9lHnIrW1ExqchhPjouww1EYtnkyG6EwKy0dI=;
 b=do25peMe0udu4ocfJZ2uuUExfIlnkQ5iVlNu5db9q0FRcj2M+zRa6buac8X6e3RHde/NojY68dlXThQmL2lljvyskwyvFMHicvG76RNSiilNQigO0anSdFyNySj5cTY+rxdQgYSOKtEs0awGo9WCcxeOALTqS2kzXR9PhWZwDVci3jPZgjv4zBke6qZCEkcyfQ38MG3xJrBGgUlFVAzac7lHYFyc9fCtaVPfeWCf1zF5XXHdj2428xZkvEah1oglnNA135wV104z3Q28HMBmd74tQY6Xq/2fL6oUh1W+eWY/GVQQ3j1qG8NRecbl+0pDUtKDNXfX5yYIEn+x6yowsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5191.namprd11.prod.outlook.com (2603:10b6:510:3e::24)
 by DS0PR11MB7971.namprd11.prod.outlook.com (2603:10b6:8:122::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 03:55:42 +0000
Received: from PH0PR11MB5191.namprd11.prod.outlook.com
 ([fe80::4581:4d81:866a:a121]) by PH0PR11MB5191.namprd11.prod.outlook.com
 ([fe80::4581:4d81:866a:a121%5]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 03:55:42 +0000
From: Meng Li <Meng.Li@windriver.com>
To: meta-arm@lists.yoctoproject.org
Cc: meng.li@windriver.com
Subject: [PATCH] arm/optee-client: set parameter CFG_TEE_PLUGIN_LOAD_PATH as ${libdir}
Date: Mon,  4 Mar 2024 11:55:27 +0800
Message-Id: <20240304035527.1281859-1-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::14) To PH0PR11MB5191.namprd11.prod.outlook.com
 (2603:10b6:510:3e::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5191:EE_|DS0PR11MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df3927b-c655-4e9b-df86-08dc3bfef64f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zAssEyo2zcm5dQKC8h5rOYD77PRgCvS4Vi7bTLOe+ScdNeXrvSS0c5VQL9olQkqjHKs5uyfxMBZCysGWxRqSHSoX+yhiIyTJ30Iuh3R9l3YO0NUVonzXlwEYssO1so66J5mDfF9um1W+4MUJa0vG0hoV7eJFlzrbR0pVk7Xfroc2Vurl2HW+lSVk5OdZzxQzSy5BDwddRybv2EN/tFYSSef+LcovxbMyZI7kLYt26G+aAiwho+S1pnp+ifgPKGF7zYKJOQprZZ2iUHDrXtXzu7EaW0HAXrFfz+VWs8pW9ZSUo77PKa4MPwXxx11RO4yfTH1Pms86KoiVGdvF6YFwbAlJFacpQd8DRmQN11xRbWNNoIP7P+uAoeMc4OR23RQNDdrLysqHTRK40c8rFOkSq1tTQgnvuU7E8ug9heedLSquANK2wyjX8q1TK0cnGg4RBsUQnAyxVOczOzqYrn6Fu+PAW7BYUUlAhAq1MmHbOVJKSjugEYVvmSxO3EfIP2xHq/uhKiF2YvS4UwDGVqLiYrR+gUulAU+bXuOPVrVk9hxw7qbGzYbWVySv6DHpmCKpNO1EhyrlO8ayC8sp6Ebiq1u3f5lyt9O7jv5xkq1U3rq7W5GFdWXYbpDeJLW0eZXoDYNnMSVM98csTC2x3H44Iwu04uJRYFD7fUEpaDdiRjyhC2FpAslcalGQDfIH1noWJj+9M7y8HCDKeEUNQm8JFbD7pByiknconwj/cvoaZuE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5191.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eCO55xZgKmYEWYFeRf/4cRpNLqgk9ZwCOxC2ElKgsDnllr/Lu9FIdXsS4FKc?=
 =?us-ascii?Q?ZqbSXoAto/joD8BpHWVz+2UyOlHUqI2E+vhPrenQG5Hgheyue1WegzmoSjje?=
 =?us-ascii?Q?hTjkC8MZlPU6RPg+sSHAyUe712WD8E75/dyZADW7w86aImxiYZHbQq1R4JW9?=
 =?us-ascii?Q?nvOVjx7HGt9YkxU2xJ2WYT34EerluQwytzUof71oKzSOgBJTkLlZuCPuaTAh?=
 =?us-ascii?Q?HosUAXnbhxZKd+I5DI2JOFlm9XIIDdg/Z7sT6O2c7AzIypJUqwWw5IOgyqss?=
 =?us-ascii?Q?fjLoclMGRCxRin7za5K/Z+gN7z7O0cOH4lwvbuO5i+X42P/s3bOMOezxG+1r?=
 =?us-ascii?Q?3FsJQ2pMBHFM7trlOd4uMPCI6ZKxKQg1uIZKOSBdIlrUSQRtIHRWgVplp3K7?=
 =?us-ascii?Q?TyfYu7w06ylVS1NR7RzJ8avRfKFig/XYmchf+zwpyWbnNm3dAfXHDaCshcQ8?=
 =?us-ascii?Q?cFcgQyTxB3aM1E4Z0TRSlROnYGuD6qBg35B3/NqRCf8/s90h5lP0N/FULAcb?=
 =?us-ascii?Q?q29i4KXrjpFtXOuv/nK8i6iBEybHtY0ulaUmFZUP7tkKb8lmhKCQod7jzynf?=
 =?us-ascii?Q?AabyiDIPyWJhr7X2/mhRizBZk4gT+OJyKSoTxXbK5e5zmOqbPPv6/gEv34B8?=
 =?us-ascii?Q?6Umiuu7YarZroxfTqOnXsNJj0X9bVlCASxdru8f0Ti4+DEiSkMqr+9+TmtgO?=
 =?us-ascii?Q?cL+49x83JY5VIbGB0pDmivXkNuWmOPQOdGXx8XL60RzpnEeyjX1EBJfvsWKN?=
 =?us-ascii?Q?gthzvh4pfoEmdvK5+agzH07pkQNh2ydqzZ2lRxRajDADSzpenrxO0wvSH5XB?=
 =?us-ascii?Q?NwHgrUaySISTh7rQotnOfK86axhEcYb5tm6o7m75tjSJ5WmHQfmvAY5wmVLq?=
 =?us-ascii?Q?ZO/tYGz/yzI+glFJCW35GtKL0W+0QWb71Xe//9bw0Vww5nawQyIM/1+8spPA?=
 =?us-ascii?Q?WnFS6ya/wJ6QpDKKaLyW/6g1Y9piiEYwOCuVhyTFgA6xoOY4ZsAD3aC7p43d?=
 =?us-ascii?Q?WK3KSXyl8SOT1czI3vtTkP2GHw05eFyTK+qarPiWu3jXSpTnYeiWebsAJnBU?=
 =?us-ascii?Q?l3qqGnibrlA4G6GbeGAc8AGbfri2Yxbuu9pdAalq3gZKQXs1Ub5gjzkBcqPV?=
 =?us-ascii?Q?0eEvqUMhQ5I7t1Q4OFjT+lnbrPdxEDOcIeZfB8eCGcH6OtueZWwgZxSXZ3Q4?=
 =?us-ascii?Q?TDNxEwC3r5WggExptTSL5MjZ1YzsimKPX9DEccHv1K7+jhZF5FExdIQqcgdy?=
 =?us-ascii?Q?6wEUS6gm6MNh79qpAJEIQ0ynbr8oq/Tph6zttEby7cRVf0aj/411697a4Ky4?=
 =?us-ascii?Q?o91pScP7MEVOKYvakBgmaxt1MnBATJ2XJ7kGce5P1Ys3rtGngffQLBUPCkXI?=
 =?us-ascii?Q?ywQSY3L3mjNfqv3WJ9aHDabkNVAZs5frGXmMYaydNT/IRZqLSBe7pj2AUCBC?=
 =?us-ascii?Q?BquzGhLZqjlPS0IJWdM5ArjAGC/g+L+mHIkTpL/JY5HkxLUokOtFPeRDwXyZ?=
 =?us-ascii?Q?WQA0RPcln5hA3cU1Q2xd+MtBym69nRM/RR3Pv/NWfMOT71XN5wgS3IqaMCA4?=
 =?us-ascii?Q?cmH+1Pd2nHR7IGjAsptzAlyHqcY4Ygl4+tGdy5bk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df3927b-c655-4e9b-df86-08dc3bfef64f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5191.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 03:55:42.2476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBAPEf87YiLWQFoQhHl/gqRzOwiD2mIvu0/yQjdb1s5UaEUprgxbF+Zvg8G02vVf/sFrV9dfZc18sQpQcvfQhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7971
X-Proofpoint-ORIG-GUID: 1S_G1wCPHZDXEqjDwNchuOt554tr3FpQ
X-Proofpoint-GUID: 1S_G1wCPHZDXEqjDwNchuOt554tr3FpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_02,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=842 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403040026
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Mar 2024 03:55:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5405

In optee-client package, the CFG_TEE_PLUGIN_LOAD_PATH is set as
/usr/lib/tee-supplicant/plugins/. But when multilib is enabled in yocto,
the ${libdir} is /usr/lib64, the optee-examples and optee-test package
will install the plugins into usr/lib64. This will cause that optee feature
doesn't work when it can't find out the necessary plugin. So, set parameter
CFG_TEE_PLUGIN_LOAD_PATH as ${libdir} to support for multilib and
non-multilib feature.

Signed-off-by: Meng Li <Meng.Li@windriver.com>
---
 meta-arm/recipes-security/optee/optee-client.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
index 3b9943cc..ef03045c 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -20,6 +20,7 @@ S = "${WORKDIR}/git"
 EXTRA_OECMAKE = " \
     -DBUILD_SHARED_LIBS=ON \
     -DCFG_TEE_FS_PARENT_PATH='${localstatedir}/lib/tee' \
+    -DCFG_TEE_PLUGIN_LOAD_PATH='${libdir}/tee-supplicant/plugins/' \
 "
 EXTRA_OECMAKE:append:toolchain-clang = " -DCFG_WERROR=0"
 
-- 
2.34.1


