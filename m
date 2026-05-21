Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94408CD5BA4
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 09:47:07 +0000 (UTC)
Received: from mx-relay30-hz12-if1.hornetsecurity.com (mx-relay30-hz12-if1.hornetsecurity.com [94.100.139.230])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32963.1779356818943395820
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 21 May 2026 02:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=f+kER4Fo;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.230, mailfrom: hsimeliere@witekio.com)
Received: from mail-northeuropeazon11022117.outbound.protection.outlook.com ([52.101.66.117]) by mx-gate30-hz12;
 Thu, 21 May 2026 11:46:55 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjw0K4soQjzbPk9m+xc9OT/uYTobeZGkJecvD+XwvYaQE/B/pXnowYJJ1ON9Y2vRAJ1XUQp82npfRpSTTtSlTxKgbu9W0cRhjXNx3zMPgit3j1WCE4U44Pmjy4akKZ3duXogojKy8iPa03RYiBMoGVbU/tiMbcnt23sJiVAUYmvo7mT5M7B3keQW7Ko01OlXZ08DD5cmBaQ8WW2RhulrK5dCmhTb3Wkdrzili5NIoBO7g+gygDdq7XKZy5IgrRik/+uaj++i1gu9XH0pw9LJ05aQZlISNeQHXPKplsliGDW9WYyIw4jxWjQd9phVWLMy1vnAtuuNrSVa63akuBNuYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVk9spNksUO4l9QAiiBSDhumyue/MVnQvStv0+DIy9M=;
 b=LELDO6k0yVUZKjh08TUQjpGsOsGEwJK5fiQa0fWuCKHHcgKXm/Tgl3jap6yTJBovzhuojul5aMPFieXeEv2NZqoP2wdply93QXvqa4cWVlYC27x8YB0uqtQTqjbje01LlZ0jxETNcuLDTH+eteNKcNpREP+TOlFCaP9sVKBIcHNYPtNqJWyJ+wM1iRwZQFhPzfNuszxusUJG82bDwi+sglNvp3me693GMwDVpj78uF/RVi9qQsKLzn/aeGVRn6onKeV2cTRcHAmpvKl6dc+NX3csY0Mgud8XgRmM78qKUejj8fib6ySW2TnX6GrPygWOR1W2TIm/t1JRm8pOXGNNBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVk9spNksUO4l9QAiiBSDhumyue/MVnQvStv0+DIy9M=;
 b=f+kER4FoQNf65DhwJ/lzq3bMZkvPqhU/pXRGlpzRGdyRrFzL+iA8M6U+CkVetFf3WOeDP/sI1P57HRLqWuB9cLjoFvnw1XOWq0C1Ihc2kGamzkivH3IBgTp/QlKto1shoVFbCy/sbnsI1aie6Ua+GBxDGfI+tCnqswCs1TgxzIsW6gKb2ahVceSK0qN+/ZiTOdtJSV+zJHPtAX07dzRP1yTju5a8xbQl1QB24lOZb5W9J2C41E14kxEwS/ouyLpag7RyDaPLSMbJ4LYHD0GBpnlIjNLqMSDyWjysORIHYRNGjCwy95alSu0mHAArvKWKe8xakrH3RFvab2Xc74yvtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DB4P192MB2786.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Thu, 21 May 2026 09:46:50 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Thu, 21 May 2026
 09:46:50 +0000
From: hsimeliere.opensource@witekio.com
To: meta-arm@lists.yoctoproject.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [meta-arm][scarthgap][PATCH 2/2] optee-os: Fix CVE-2026-33662
Date: Thu, 21 May 2026 11:46:26 +0200
Message-ID: <20260521094626.3365952-2-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521094626.3365952-1-hsimeliere.opensource@witekio.com>
References: <20260521094626.3365952-1-hsimeliere.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0031.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::18) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|DB4P192MB2786:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a8196d6-3187-44bf-7825-08deb71de1b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|52116014|376014|366016|1800799024|3023799007|22082099003|18002099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	kDnD6ad1/3F63/UWx2dMum3ZM0/CS0c1AmmQDsIDsSBO1NJORyE6kPByCMAeluFFr1yyvVtjmuAKNzy2pItQtskuTxwqNQrc6YN64aFB5qHNbqe5NwDR1a5F17qfBdAhyEwjL5r/oX1nxmYaSh9djOxgMhu3FNGgRPpSicLj+trI92eBKiV+O06aVKwFF79GhtcMdfcnbvJq0QW37sAl8lSdRFCeHx50KzUbFTf8Ae9QLQwwscH5twJsFphd86KLcjoV6qc29k0rmYhT+jm/mmDRX7XwTH/Du1tkV1Hs/9y/nJFxbxULJ3juA/cPJNarzNqxyRok5Z+TfTJIQTTtDEczxsZ3+DDxs7fh4bff7YNezUr5/Yv5ZxLQCOTnVGOg3skH+UJNcDNsqKblqYmQuhlVOeq3fUfn8B6Ap3dZ+DGHDQHUPELP4BfolPvgXxKr5mD/e3CS8q7PnyegaVdO9mEjkZsMIrP22AdEht1uSxl5zdBS0g7H2WF7vfmGidUJ60+orvlbBI8j3aNBw1A2B0dJ8Zk4LzsEkYDpLV6YD9t8KFirNO8OrHbQEBIhkgclyvjvCfEFLCkyzIs03ZJ8/qu8bGeEGFRIPE4Dtb8O/ZURk2b9srToemDfgtCs5JKnGD6WHWTEcP6vsQc+Ig/JdmDQMnuEKQYv5QKM0dGr0zNOhrkYtvAwONsU6YHf5wz7oyNhdLPShBR2Min75lVp/w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(52116014)(376014)(366016)(1800799024)(3023799007)(22082099003)(18002099003)(56012099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w04pEeA+vlT7Ye4+tvHyT28tifateDZTlbKeMuomiNHZ3OBlIp2Hy+ZoN4C8?=
 =?us-ascii?Q?lON7oYJD7RA9iXcM5Hq9BVkFT8uq79h0CLrRkNiFYgj8tlHabi5OwW5upZRo?=
 =?us-ascii?Q?FKpsDaK3DY09rJAZ4EwhJJ3FG/hBde6I0U7q9GBEbsxragQeo1UZotKnJHoV?=
 =?us-ascii?Q?halDTiOpV3yo8WjGUKrju2jqAfFf9LoZbzQMZOIKvCQYzLKxEJO0AZFQ1RvB?=
 =?us-ascii?Q?c8b8lZNi1p4JW6Nx09T8Yi1yyEbnqpTOzutWDo5p8w+6gwNp07KZb2bUoj2V?=
 =?us-ascii?Q?NOmKGx1QPne+9dXfUoGSGIIdNeD0RVf3TRm3ndf1RJlwmp6TKU6r1z5RSg1m?=
 =?us-ascii?Q?LfPsoFQvGWX+8Mfdkmi2FClUmVT0ld74R5XZB/U82GolInQtHBTrIV1I0GR+?=
 =?us-ascii?Q?0VcIwwZRjmumA1ittIODDU+lJhqqwHDRIocUY5efbZBBrrfzaa48+M94myUM?=
 =?us-ascii?Q?B0JgxGQ7YPPHh/bfOZCcV/NlAsviocxjW7qb5pWl6E48oon0g323D+urTOkJ?=
 =?us-ascii?Q?7Ajupy4IhW8JpiU4mx67N5mOJjnzrKIGzhiGhLVc2DIbL/salVpVoeQK2OJR?=
 =?us-ascii?Q?+I59vH3jWQokDxALepgjNQlP+KoMCui0KqgYHpujGV3ieouG1WO1PuwRv7d+?=
 =?us-ascii?Q?ArRoRdwh7chmrlHdkFYGlUDbb3YDEFUeULESqklVKL6XXhzlGb5FeyVqI4Tu?=
 =?us-ascii?Q?KKxwS8ZTfa7YTxBcMjwkzLCPsHsfs25PsUSQSrluoKQX5Tldbwdm+6UZjMa0?=
 =?us-ascii?Q?tf2AUzd07t27tcnhuTsZ6GEHASz8/S7bnLVjJ2m/L95GrVn3ZT7mOTJkvEpt?=
 =?us-ascii?Q?ml/7X5zMsU+yv8br7wr75xMJBc75GKU96f3zv5JaZl9WHn7AGLJK0l8Cqci9?=
 =?us-ascii?Q?TkxLFrf4Jvu7rJioGggLrtvNXkB1aLUP6Rg+IO/FH5IRZ2LQmZKtpFdoeXH5?=
 =?us-ascii?Q?3im+NJwgXhgULYJF7+1NJulDDCzsa4A/xqY/twdhD81IwZcDIrEqqO9953mu?=
 =?us-ascii?Q?4STMp8jCj4FinoHLtr3KjkMO9uNxtgkUPbAjN1YB8V/Q3IfZ0+0GksB2Pszh?=
 =?us-ascii?Q?eERDnH41MMXkn5KP9w17V04hMD5aZojcL5YK1CDd2GLU6L6oeJCV+/HQ5Xf5?=
 =?us-ascii?Q?HHzARhSWEZ6AHifvKHdv13A0avND0gJ2iYPZrYD5sj0QVP9lHcKHFEFaJOCc?=
 =?us-ascii?Q?PNSQqKij8JO8PCJiGE3xVXjeY2yurdSvduqQz4FDdsrn94qgSr5w8FPKj871?=
 =?us-ascii?Q?ZepwL1VEv0CjQkiTCL6Kc/9eu7XkRGt+oL1tz6P1PpVUB97ToVye5Vhto5xY?=
 =?us-ascii?Q?wYhTgpF6LkRKdIzBRsYWFrDeaLmi4s0lfDUUMD9ehN5oeaclLuiFwsXHO7ep?=
 =?us-ascii?Q?q5yS0BbmtCmUgvxc9VepUufJcsaQcHRyvAwygzf3l2dHTMkuTx56BQBHEYky?=
 =?us-ascii?Q?AoradtsnKT1km4yhDvmMS3dPo16B78CGaVNPyZIBh0u4W+CAJiWOIRwM5ucW?=
 =?us-ascii?Q?XhwCz++X9fuN1rkL25f9ZMUTbr+BxBoMsmGz6+V48pvdwx+tHdv7CZL+tWDr?=
 =?us-ascii?Q?Arhh/t+m4P3bse2cz1mmcBXWClvOVTMvKXiSKWyakCo3gHDHzTx03HyJH1So?=
 =?us-ascii?Q?GzDkVw4MRJV/2RJ8QBGT3IhFFpgEc87hci8vLbmtVm6xtBDSmpthWAGSawch?=
 =?us-ascii?Q?UzA2cMuYZTjvEJXvKrhXohY2kR5gnVBzIn/kkiIWY+JmkZz5DQ03FQBkvf5O?=
 =?us-ascii?Q?wvfanKYZWeKKp4ktRl+0Bsw1wI4BpDjPR2XmE89iHaUjVdJEEIZxkpA7e2rs?=
X-MS-Exchange-AntiSpam-MessageData-1: dJ2w7usjV5BX1Q==
X-Exchange-RoutingPolicyChecked: 
	lCW0Fw3h/dfe3k8BulNI26sSdTU5e/Pbu4ZD/9mek/1OXNXatJnqbo0QggfsnvYlgN3SRo+EMm0zutr2/5L5dDV2gqfTKRyiYfedqjolfLN+Sbw+0lsUk4I37z37nwZHMwfnnupurwOgdKnU6cRzPyy8chHtz7lYmAg0WWbADSQWP/Car1atdBUHaPSfa57lAEBTLccJ1mD1gWPWBPOk1vS3yNQ2OA4n/EzUzgAWUURzsNSnwpAqtE3rt0yNLO9ylC3dTm3QIHJqcvM9jykq0jbnynwiIXBVFBTRjthjEWEuo9IM1eRGioYckShakHgulc+3b7fakbZzHqpCcyzlOQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	X16Ay3oKUAV3bNMZk55JJ684zEWgtw7H/bR9YrMU1DTHnu9BBFzh3gSZPjg08ps6SKXFahkuJSRVrERTVImRVOUasaoK4aEIttKDXUeyIvviL4toe0Eb3fbxCite3jF4+c6FNHj+j8iyncJuf4rYq9BSoT4uil23E6SLSN2j7cFK4Z3KS1lBAe/sx7uvVsRYqxuKTr86qyBx7U78tk3eaC5Waq+JJ9xoCvLyzAFwg0aaIko1Prhi6bVO3/elA0ZhguyaItPWV3cmEuXPdgyRCLRgcD816Fr66DIVm2ZuHpCj0xmWvt0vFMwxBtcqH9a9tNtj1RTyMjzV2SmaN0TXIsx7ZNumQZCDlVRzDn9sR5pt5W7CbFwdVnL/Qu2o4ysyLArHcobFnil3tvn9HN2eZmF14Z35mSmyyv9ewwVzwEr4T5gkE30tyRXRK8aHqUrVnM+OBuuUVwo/IbDkPwkjKdvfggq5IbbynGlQ+X4PMacWObG56M2ae33aWChJniBSpKT6ELoOCqlUT295LuMc8HRbztoE26ww8FE+Llpl1jlefNxFeKwSoDVX1PRkEau7z3cKsZXyO3rAsm68TVRu4nAsaSwSgb5vIK/En4ZTtieI3Epa8ddJ//Q4oVFTjdYd
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8196d6-3187-44bf-7825-08deb71de1b4
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 09:46:50.2650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BbjdB09p0sEcY2bzGJWeDrKvVJF3HVeemeRnLM48vpBEq8LJlYZQc7bc9QqYlNp6AQE6gINqnRRsgi8O4JoFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P192MB2786
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: meta-arm@lists.yoctoproject.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate30-hz12 with 4gLk8C4dxDzmbNn
X-cloud-security-connect: mail-northeuropeazon11022117.outbound.protection.outlook.com[52.101.66.117], TLS=1, IP=52.101.66.117
X-cloud-security-Digest: eac5b412e937e7049adb0e848a69dda1
X-cloud-security: scantime:1.351
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 21 May 2026 09:47:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7059

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] as mentioned in OP-TEE os security report in [2].

[1] https://github.com/OP-TEE/optee_os/commit/caeaa2ae551666068894005387cca4113b10873f
[2] https://github.com/OP-TEE/optee_os/security/advisories/GHSA-4cf8-v5g3-73gr

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../optee/optee-os/CVE-2026-33662.patch       | 40 +++++++++++++++++++
 .../recipes-security/optee/optee-os_4.1.0.bb  |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/CVE-2026-33662.patch

diff --git a/meta-arm/recipes-security/optee/optee-os/CVE-2026-33662.patch b/meta-arm/recipes-security/optee/optee-os/CVE-2026-33662.patch
new file mode 100644
index 00000000..4a427de6
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/CVE-2026-33662.patch
@@ -0,0 +1,40 @@
+From 2fdf0aa10bd23c0e4633efa087a27ff07f79015f Mon Sep 17 00:00:00 2001
+From: Jens Wiklander <jens.wiklander@linaro.org>
+Date: Thu, 22 Jan 2026 14:19:36 +0100
+Subject: [PATCH] core: crypto_api: fix underflow in emsa_pkcs1_v1_5_encode()
+
+Guard against an integer underflow in emsa_pkcs1_v1_5_encode() that can
+occur when calculating the padding field in the EMA-PKCS1-v1_5 encoding.
+
+CVE: CVE-2026-33662
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/commit/caeaa2ae551666068894005387cca4113b10873f]
+
+Fixes: f5a70e3efb80 ("drivers: crypto: generic resources for crypto device driver - RSA")
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+Reviewed-by: Jerome Forissier <jerome.forissier@arm.com>
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ core/drivers/crypto/crypto_api/acipher/rsassa.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/core/drivers/crypto/crypto_api/acipher/rsassa.c b/core/drivers/crypto/crypto_api/acipher/rsassa.c
+index 0f71b84cc..01f8d7dc9 100644
+--- a/core/drivers/crypto/crypto_api/acipher/rsassa.c
++++ b/core/drivers/crypto/crypto_api/acipher/rsassa.c
+@@ -45,9 +45,10 @@ static TEE_Result emsa_pkcs1_v1_5_encode(struct drvcrypt_rsa_ssa *ssa_data,
+ 	 * Calculate the PS size
+ 	 *  EM Size (modulus size) - 3 bytes - DigestInfo DER format size
+ 	 */
+-	ps_size = ssa_data->key.n_size - 3;
+-	ps_size -= ssa_data->digest_size;
+-	ps_size -= 10 + hash_oid->asn1_length;
++	if (SUB_OVERFLOW(ssa_data->key.n_size, 3, &ps_size) ||
++	    SUB_OVERFLOW(ps_size, ssa_data->digest_size, &ps_size) ||
++	    SUB_OVERFLOW(ps_size, 10 + hash_oid->asn1_length, &ps_size))
++		return TEE_ERROR_BAD_PARAMETERS;
+ 
+ 	CRYPTO_TRACE("PS size = %zu (n %zu)", ps_size, ssa_data->key.n_size);
+ 
+-- 
+2.43.0
+
diff --git a/meta-arm/recipes-security/optee/optee-os_4.1.0.bb b/meta-arm/recipes-security/optee/optee-os_4.1.0.bb
index 1846baf0..7d948959 100644
--- a/meta-arm/recipes-security/optee/optee-os_4.1.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_4.1.0.bb
@@ -10,4 +10,5 @@ SRC_URI += " \
     file://CVE-2026-33317-1.patch \
     file://CVE-2026-33317-2.patch \
     file://CVE-2026-33317-3.patch \
+    file://CVE-2026-33662.patch \
    "
-- 
2.43.0


