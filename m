Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.72])
 by mx.groups.io with SMTP id smtpd.web12.3791.1588850264985625731
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 May 2020 04:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=8mgCHd0R;
 spf=pass (domain: arm.com, ip: 40.107.15.72, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAYjP78JDX7V2KA2wxyLt9TPZCUHBNkYm1dhSQOjnPs=;
 b=8mgCHd0RPDC/AqY7QeVdMNXgRRbOwLfWabOugbqF7yCnfBuyvRnmxVSUmXULn3sqY7HjO3PZFcRlzx1CwW+8op9DyafSvV2quQ430gZuzDl9HZenbHvvLICfKE5mhXtCSEgDD2SMjNDpj62F8ozHb2kItDeb7h7E76r3F65Gaa4=
Received: from DB6PR07CA0113.eurprd07.prod.outlook.com (2603:10a6:6:2c::27) by
 AM5PR0802MB2401.eurprd08.prod.outlook.com (2603:10a6:203:9d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Thu, 7 May
 2020 11:17:42 +0000
Received: from DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::72) by DB6PR07CA0113.outlook.office365.com
 (2603:10a6:6:2c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.11 via Frontend
 Transport; Thu, 7 May 2020 11:17:42 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT019.mail.protection.outlook.com (10.152.20.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 11:17:42 +0000
Received: ("Tessian outbound e88319d7ccd0:v54"); Thu, 07 May 2020 11:17:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ef9d169d4fb66bc4
X-CR-MTA-TID: 64aa7808
Received: from dfbc7d01e75f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E97889E8-DED8-41C1-8A67-4C7C745029B9.1;
	Thu, 07 May 2020 11:17:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dfbc7d01e75f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 May 2020 11:17:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecfJdwJ3M0oWhmfygpp61HiDFnJmiCBt2SxB6G4U0BbfXKXYO0Eq3YRJcKEqTrAIu5ziMIY+qFrFPsZTol3niBQdRbMV5sdwGU3QIjZVl8t5wHacYXPBqbQy0mau8EMP1tEO8nklYIYfxWfYZMkHxYhLG2oU1lbE1FGqpZ847wKKUD8AeTiP+ak+v+69c0N2SwQ74wl3lUqnQQd6+GqNTUHr5rKGhdqDDT5Y11Dsj+fY86q1cwOYuFg4DE0E9luk/FzHyWYekstTj1aljgllT7wPufuizIqhd13NK9Lx/dt1EtcfRCLN6+qsBeZBEDKaNIX0WfalaCxbc8Xh3TCPEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAYjP78JDX7V2KA2wxyLt9TPZCUHBNkYm1dhSQOjnPs=;
 b=NobB0VdLkhkPpZUWjKk6APOgFW0x3Bg/ls+JPlUM1ebZbzU7YQgWXGFLzCqEFwAJDil3AL2UggqQs/vnuZvLqEC4bpEgdDwro5ydjcHnBHy/ELUUnkAQYQ2KgI5ZXATHvw+mE0YwFJiPb+kE5qeSY/flPioWd4IhQFM3d1Wq4014WmU0v64Bp4FNDdVcXsqOxGEzIM5pH1KQ7GQR++axRWe9xNZPzIRy1V1HMp3YdJsz3HUmyIHfBi47L4S5fQX1vDvfYLBfVvv/BKm+eOKTPMgfNJJ1HFJPaS6owbmW5hNAFdc9yz1gStkcWUcxerbAstj7oZteoxqsqk+2havsBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAYjP78JDX7V2KA2wxyLt9TPZCUHBNkYm1dhSQOjnPs=;
 b=8mgCHd0RPDC/AqY7QeVdMNXgRRbOwLfWabOugbqF7yCnfBuyvRnmxVSUmXULn3sqY7HjO3PZFcRlzx1CwW+8op9DyafSvV2quQ430gZuzDl9HZenbHvvLICfKE5mhXtCSEgDD2SMjNDpj62F8ozHb2kItDeb7h7E76r3F65Gaa4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3482.eurprd08.prod.outlook.com (2603:10a6:10:42::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Thu, 7 May
 2020 11:17:32 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Thu, 7 May 2020
 11:17:32 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] [arm-autonomy] arm-autonomy-host-image-minimal: Abort on copy fail
Date: Thu,  7 May 2020 12:17:22 +0100
Message-Id: <20200507111722.38641-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0327.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::27) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.51) by LO2P265CA0327.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 11:17:32 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 693585c5-bc21-4f29-12d5-08d7f278428f
X-MS-TrafficTypeDiagnostic: DB7PR08MB3482:|AM5PR0802MB2401:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0802MB2401394B9A262FCBABE6A0C99DA50@AM5PR0802MB2401.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:65;OLM:65;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 iwWygjauUGCQf+9OEklTtS22F1CD747nEkWVvmWCU2wpf+fFlKQ9hwn22NGYB9tK3VrhVyyanebY5vTaZfS68cHVaOmPwWNtsU7ELgrc+YkA73hURThVtGjTpGv2Jku9uP4RZ6becQ5/PrLkvQSOjlPQ5CX3lFABk9SpFu4/Z0FC2q1x8huCiL2OZ7o7rIz0Zz6u4erRKFZ7u2Kvna+5GUX6DYvjZgTcNNjIJ6orcCa7LhxDtzTszMtkFVevUDeYoddEVd8srAY4PcJu4C1l/PIugf69UomhpSkafJ3m/6lLYfXzPM5VMSu6lVnGX/ECl6v8sBx4VhCsBnkAHG2fLWSJ8x1DF1DGt2XFXaBRU534w0hBaOi2npk/m2WO7jTl7jAXzTRiiNS+QMyjzCZG1PVjz2NDzdoNp1yv9yH1JxNXjNYpc+StaWcUdpUWbly4xB0jqwHGarBavsN4X+7EWckmpwLZQ678gA5BKvNBirvKaP3AmhnuhmNLBDupMLpJvPj7iigfk4gdkPUs1sZ8sQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(33430700001)(66556008)(66476007)(4326008)(83290400001)(83320400001)(36756003)(44832011)(83310400001)(33440700001)(2616005)(956004)(8936002)(83300400001)(1076003)(8676002)(83280400001)(5660300002)(6916009)(86362001)(2906002)(66946007)(316002)(16526019)(26005)(186003)(6666004)(478600001)(52116002)(7696005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 XFqK+Nyc78t65Xg4X46FB2wDVO9QJDauQfDMX9pRMaOe6gyEGQX+lwcW44kPQ2LgGfgOXHBfOKIx6ZmRi7s5gdHPtlmGGmMRrE+3qH/jKJ75D/UfT6EXZYgtChpHa+xRRADoK1blteT6vON5EbtLc/mLkx01T9Ld4otUaPvAJBqwpYjA4IJu9OnEa28m4QtxYbI1TK1FvdSM4MOKZBJpVAdhuXhi7QJnFw4VKUqqj00iCBUJf1jLvmYENLWxbfqg7u7jlDAl5NNJFrUna/Wi6O8SGtWDOUm2PttIXYudV3Fj0EIBJ3eo6WHEwIJH0N+D7grVkQpTJWcuokFpD4fSOMud8NQ9Kq8GWAgM6zKaZ00l82l2gB3XWdm8ydauuBKwyKs07yPGTtscYM1ANUBrwJK/Co3FAA4okYLT/Gqoi+wco4bx3/1PBlaOA50AzbE9j8rZb7RJqy9aEQ7t9eCjBE8kNVaft0UGS5iP0mBe7kJ/ZbZ1/vjemt9ekEsKSbQx5TOW0SUdVdFoNkHaYCexezr745UQgGg987NyPA3tes8VO2c8yUUSrBDqwksQse9Ko7hpS6CB7tAeqAdblueeBwrZkhsK5qOQy+dyloOMGR87RWfPNw57GbCjcBMz+q3rdaDDMKbb5BflZydZu09SDzpd7dQoJfh7Gyn2KR3ToBMDk0FibsQBQcfa3FS3/OF/d4GEp4Md/vRXyzczKitQLy9N5ndxwPbwE/vFRRewCMd0f39MpDlygsyOH9hd0URugEWxNw+zb+0HbGLTOzdTX0tR4nps7fadipm6acJ3Yxs=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3482
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(46966005)(33430700001)(1076003)(2906002)(6666004)(478600001)(6486002)(86362001)(16526019)(5660300002)(70206006)(956004)(26005)(33440700001)(70586007)(7696005)(316002)(6916009)(81166007)(356005)(47076004)(82740400003)(186003)(8936002)(2616005)(82310400002)(36756003)(4326008)(44832011)(336012)(8676002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d3864d14-f64a-47c5-a641-08d7f2783cc9
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Brk0mpxvWM2n55Ny/HB9USll03VafnM0QgGqbvimiSYrUBBe+pUNTyS4D5aYTz6UBrpJ8xOdYeiZteV1W8BL2C2oAcmWfd/s/tiYwuH7IckyU00yH6E2WtD2Mh/qBxxrsaih4t6Li4xURyIPZayLbg8fHVQtiawdZEh8Bz3XnSVebUmoWFc3TGwIzQeoH/shBo/9acri9FmArqqH41Cr/xJQcW3L0c/C2DXxfF3NazfBxBfQztrsjLKUjDWF/P234k8e3XNwYlsMpnXbdyMQR0S+UjulK7mAGcwNfuUHkoe8CDq/FJyVZIJU1r0e448QiTKJZeJTXf4NYul0zD/qEac9F2+TtIlTH8NtcvAcZTrZpz5xS8ohtbBEmFFrIfYdJNpMsJXAFFb5KTGUhwBCNAsYa5zSVPYs+PdVwMe6PKnX++NM/iJO25y5sjTajbrMR3ZOp41VQfXEv4pVkBCLPBJaMYu4JbG9rQu/JHsSm9dqyIUopWYWEa91CJC4Y9av0rY8lPkyct0A3tnfQodFQ2SfcP/wiRHICEsWrzBuLjbT1dIXlR63KfZPr/8tiG6Gdig5JN/VMk+K6L0XuzJyPw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 11:17:42.2824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 693585c5-bc21-4f29-12d5-08d7f278428f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2401
Content-Type: text/plain

From: Diego Sueiro <diego.sueiro@arm.com>

If the guest image copy fails we need to abort the do_image execution.

Change-Id: I3785a0828e271ed27eb7f9212804b5b9b39f79ac
Issue-Id: SCM-990
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-core/images/arm-autonomy-host-image-minimal.bb     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
index 3859f52..5b20fa0 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
@@ -112,7 +112,8 @@ python add_extern_guests () {
             # Add file extension if not there
             if not dstname.endswith('.xenguest'):
                 dstname += '.xenguest'
-            bb.utils.copyfile(path, guestdir + '/' + dstname)
+            if not bb.utils.copyfile(path, guestdir + '/' + dstname):
+                bb.fatal("Fail to copy Guest file " + path)
 }
 
 IMAGE_PREPROCESS_COMMAND += "add_extern_guests; "
-- 
2.17.1

