Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.53])
 by mx.groups.io with SMTP id smtpd.web09.5885.1605607551434887351
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 02:05:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JUjq6oah;
 spf=pass (domain: arm.com, ip: 40.107.7.53, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cT7BVNpcJDuHUBSpLNFip6FXtkmQDwJ1CiIqt0YKeQ0=;
 b=JUjq6oahH2Nq4lbl1uANEtAa2Q6STG13wMg4xKsZR6Uq0uKuOvUmIVFK19nDEzogX80UW/S1rrpipeRl2DcUOli3uzr0JcrbfwZmkfiz7laWUsb9RYedf+BV8tItwf8vKAARgBSl7FcCIuLuYFfSPDiOCjLHwJriXp3zgPJmK7k=
Received: from AM8P189CA0015.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::20)
 by DB8PR08MB5035.eurprd08.prod.outlook.com (2603:10a6:10:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Tue, 17 Nov
 2020 10:05:48 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:218:cafe::8c) by AM8P189CA0015.outlook.office365.com
 (2603:10a6:20b:218::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Tue, 17 Nov 2020 10:05:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 10:05:47 +0000
Received: ("Tessian outbound 39167997cde8:v71"); Tue, 17 Nov 2020 10:05:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2b111e5f004c9c54
X-CR-MTA-TID: 64aa7808
Received: from 06c69ec26c36.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id ED13F1DE-FEBE-4A1B-A289-3B3B05CC9AEC.1;
	Tue, 17 Nov 2020 10:05:40 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 06c69ec26c36.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 Nov 2020 10:05:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hp0+Ia5wC5HndAT+pKJvUUulaCtqPCvKYm7JleKpnFQWL1T7BsxeTEFfBoBm2wB9FZcj2YcbYARbFv8RKGwoqNMv2AmeBkmeetFGUx9VwhZMoEXfRLr22BIy6W4aYzuEe8sYS1/fAuOvk3HOUY3l1iHGZ0XI+YVzgR95DQIgD0c2BZYr7Rte+t64gStF1mssBsgeAIIgk9S/iAhsykZDW2VsrSOIkXW5z24hdbXmoInjdzC5/bcG4oqq/pquAvX+nHoMKRaZ1kqlGfeVCDe512rMqtM6/Nu8nw2mvAq5Uky+Nbv/WKwAw7uvmfy8eZ+hV7rcTAekH7PgJoM9nibetg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cT7BVNpcJDuHUBSpLNFip6FXtkmQDwJ1CiIqt0YKeQ0=;
 b=Xakom26tWAXXK7y97swmnOh8eYSfWhH5iBn8um9oKTHWgxCk5YA0Kvl+qbKsnBNrFlhzAHj6AloudOAm+MO2usBUK1Lfs8fMewB5Px77tqjHeabW9BZUrdD5myyiEOue4/ERKzAp0yvcNCVE+wgbvOmscvxez4yDD+Jr8xOnsQe0eE3Gyc4TPQhqhELsFpMm+AVbvQNEt5df9sTEanbEg3OcemL9Du/22CieRzSr/L14EeOqV0wbX/KaJ030cNgQ1G3zeK8KbC8/CaeWJrCRl80rC9zj+b6dk5HF/Q+WzRGKyquW8kFzJdJeTxuOPVp+sJdk4uWvurDoUFUpRnfAsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cT7BVNpcJDuHUBSpLNFip6FXtkmQDwJ1CiIqt0YKeQ0=;
 b=JUjq6oahH2Nq4lbl1uANEtAa2Q6STG13wMg4xKsZR6Uq0uKuOvUmIVFK19nDEzogX80UW/S1rrpipeRl2DcUOli3uzr0JcrbfwZmkfiz7laWUsb9RYedf+BV8tItwf8vKAARgBSl7FcCIuLuYFfSPDiOCjLHwJriXp3zgPJmK7k=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3110.eurprd08.prod.outlook.com (2603:10a6:209:45::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 10:05:38 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::cdcd:fe5b:60c:2a9f]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::cdcd:fe5b:60c:2a9f%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 10:05:38 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>,
	Kamil Dziezyk <kamil.dziezyk@arm.com>
Subject: [PATCH 1/8] arm-autonomy/linux-linaro-arm-rt: add linux-RT patch for xen dynamic events
Date: Tue, 17 Nov 2020 10:04:42 +0000
Message-Id: <20201117100449.20111-2-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117100449.20111-1-diego.sueiro@arm.com>
References: <20201117100449.20111-1-diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.50]
X-ClientProxiedBy: LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::33) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-dievar01.stack04.eu02.mi.arm.com (217.140.106.50) by LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend Transport; Tue, 17 Nov 2020 10:05:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9768ce0d-0707-41db-83f1-08d88ae05b2e
X-MS-TrafficTypeDiagnostic: AM6PR08MB3110:|DB8PR08MB5035:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB5035F7A382D7F20CCB24BD6B92E20@DB8PR08MB5035.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 S40Rc2iLo6S4SVJuJmFAMmL8Fkh3eQPspizZBo48JHccTOYR/WhOYrzTIRx97PMs6HuQ5GOaDBURt9hOsRGjThVOUGlLuteuTE0b52Lcr4kNcQBODz0gYjUvK1ocWzI6jdiURmrnBAyTIx57xqazk2TUhUiXxfzdS8m1tIhv9hYmAwRKZ4IC8Gbstjvn31Zjf4sr4gi21x6hO0uyDpa9W0hsZFOI4ytZwxJ/6niAOlyiRzOIt1l32kyUBcbnksqONCJRIfL6TRY/Pz3OSIYvdlILvtZoJaKtRmEC4hcqSD4+CEY0EJl081ERzIEka3COcorU2zWbPB3biM076E6ZaRJEIAVWUmPROm/hoelQJr3Bv4njPbHhTmAyCef9PK5R1ebtv2sOkpK7TYlv1T+xAw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(6916009)(8676002)(8936002)(7696005)(52116002)(26005)(86362001)(66556008)(66476007)(54906003)(1076003)(36756003)(66946007)(2906002)(83380400001)(44832011)(5660300002)(6486002)(956004)(16526019)(186003)(4326008)(316002)(966005)(6666004)(478600001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 72RmioqGevWbkDBwg1gbRV3rGO61+KkBtRylURd89k2djv82Y7+BHYr4VeRkBN7Vg3XnfCecHrkQOEC8cDBYGStCuWGiNxfUFwdI4h14xFko7FoVQtSNJ2CAX7wvcQG4lkPZ8475Wo6p51vuDZP5HMhhXHueCeIs9Gn2Md7YQf+J8DJWpQY4NS9b1hqcS+X2fgH3Ex3ZGKlr6qEzUCPSm26Er1BofK/1N3qZfQmoT2GzjPPEhWQrAszjIrOi5iW20Vl87qd7dW2vtP++n7jmUEjY7ZisJnJH7tKL8J0kk8nSDvnZ6BTmkzvKm6gsmbXfc87QSWXNkyC82aWWbEzkdFnqfAF09z65e5qV5V2ugf8Tq6OUDQ24D/b0iCHXjfagTqsau/a0UEW/icdaj3EPsnmOLs4CFgESgYfbG/jgeclaJ3tWgVMfmbBTjU3j+JvMC2wUKRyd0VZa3zLW3QRaMxorP2+iZe7N2k8yFKY31RMYrkq/SzJUsOJMEOd1g8Nqvuhhi+FPN0JOfLKvdIKQoCqvJTlfehhmcvFPM9HanvlqiPyeSloCbTO0MVTsRUdW0sJMWsDL2/+J/dWlmKnW6+DcGUyZ0paRMgo63JISyFtAIkrR8nBxqQWgQ6gJbZzYDkB31hEyfAHStY3byzltkGwjcUoylQne12XZP4w/qLLI9CHKAFpZEfnRDwXmpoBTTx2l5X9CJXiLwSv7JDag81QsSk+IIMEDDP3Cz3jcrjKzBccHTRWS2mvIF78KfSsPAQrHpAf2RRIKJQxdT22IJOUB4fDyaWQ7x0CKQRoKr3Zao3pHLmeWfDF+MosmLJ5LSNFYCUxrzccrCAg4M3jYMt4/Ow0KaUi9jMiBdyiIFwGNYUqBlCg/SBkmdgCFCPyfpfhHPWNUOOXDjCQtTTEQfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3110
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bd43d149-623b-43d1-eec1-08d88ae05590
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A+nj0TsDkRQsMmCK/dkEhSpKL/kYPas2KlSNLdfEVbwjQMJqt1Jc8K3gd5YRuSA14yXWVjGq2aBjLIM/tjwjx8CHJQlDy+jqt1ilJiQStxKmhujTF5CckYAYKFKGxSt4BNACEiWHAV/9y654sfsV7gd8TTUltcbKkLd3LyMiUjba3hfybBONv2eUe1+BODTaAX15kzCCXOzPGAetkm6AZWptupVeiu169bOMJ/7ihWJ9wt8SPJO6Mh3pRU9FjlbMwlPsTJtpE3lcMCE78FKP3RfHKELwDXI1uA/EaivHWbr4MM8kNWf3/Okkw/effDTRbKDcRnSiKHptVpZ/dH6Y40LmCYggqQimbk9qiZI6ThjA2BQY53Z9vAqPQqbcjmZykxh/dleB64EHUDxtBqaLYNtVVv1DHZfSSPaIwUR/ugOGncXPo5Vf9dlb/OrCnV0NzJeWPsYXOhyRgz0Z7KrNm3s9AyGHNpokNm5BBGSXP9E=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966005)(7696005)(26005)(70206006)(186003)(2616005)(70586007)(16526019)(6486002)(956004)(8936002)(44832011)(6916009)(86362001)(83380400001)(336012)(1076003)(5660300002)(966005)(47076004)(6666004)(356005)(54906003)(36906005)(82740400003)(82310400003)(81166007)(478600001)(4326008)(2906002)(36756003)(316002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 10:05:47.9373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9768ce0d-0707-41db-83f1-08d88ae05b2e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5035
Content-Type: text/plain

This patch contain following fix:
 * xen: use handle_fasteoi_irq to handle xen dynamic events

Change-Id: I0b1734247b151d65ca510a074a5de56e8f8f0ada
Issue-Id: SCM-1654
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 ...asteoi_irq-to-handle-xen-dynamic-eve.patch | 80 +++++++++++++++++++
 .../linux/linux-linaro-arm-rt_5.4.bbappend    |  5 ++
 2 files changed, 85 insertions(+)
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt-5.4/0001-xen-use-handle_fasteoi_irq-to-handle-xen-dynamic-eve.patch
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bbappend

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt-5.4/0001-xen-use-handle_fasteoi_irq-to-handle-xen-dynamic-eve.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt-5.4/0001-xen-use-handle_fasteoi_irq-to-handle-xen-dynamic-eve.patch
new file mode 100644
index 0000000..39c159f
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt-5.4/0001-xen-use-handle_fasteoi_irq-to-handle-xen-dynamic-eve.patch
@@ -0,0 +1,80 @@
+From c2971c8a3f076ea8a522ce4fbb367d112d86c13a Mon Sep 17 00:00:00 2001
+From: Stefano Stabellini <sstabellini@kernel.org>
+Date: Mon, 27 Apr 2020 16:15:26 -0700
+Subject: [PATCH] xen: use handle_fasteoi_irq to handle xen dynamic events
+
+When handling Xen events, we need to make sure the following sequence is
+followed:
+
+- mask event
+- handle event and clear event (the order does not matter)
+- unmask event
+
+It is not possible to implement this flow with handle_edge_irq, so
+switch back to handle_fasteoi_irq. Please note that Xen event irqs are
+ONESHOT. Also note that handle_fasteoi_irq was in-use before the
+following commit, that is partially reverted by this patch:
+
+7e186bdd0098 xen: do not clear and mask evtchns in __xen_evtchn_do_upcall
+
+PIRQ handling is left unchanged.
+
+This patch fixes a domU hang observed when using LinuxRT as dom0 kernel.
+
+Link: https://lkml.org/lkml/2020/4/27/1287
+Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
+
+Upstream-Status: Inappropriate since the upstream solution diverges from this patch
+Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
+---
+ drivers/xen/events/events_base.c | 13 +++----------
+ 1 file changed, 3 insertions(+), 10 deletions(-)
+
+diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
+index 6c8843968a52..1873a19b8b24 100644
+--- a/drivers/xen/events/events_base.c
++++ b/drivers/xen/events/events_base.c
+@@ -845,7 +845,7 @@ int bind_evtchn_to_irq(unsigned int evtchn)
+ 			goto out;
+ 
+ 		irq_set_chip_and_handler_name(irq, &xen_dynamic_chip,
+-					      handle_edge_irq, "event");
++					      handle_fasteoi_irq, "event");
+ 
+ 		ret = xen_irq_info_evtchn_setup(irq, evtchn);
+ 		if (ret < 0) {
+@@ -978,7 +978,7 @@ int bind_virq_to_irq(unsigned int virq, unsigned int cpu, bool percpu)
+ 						      handle_percpu_irq, "virq");
+ 		else
+ 			irq_set_chip_and_handler_name(irq, &xen_dynamic_chip,
+-						      handle_edge_irq, "virq");
++						      handle_fasteoi_irq, "virq");
+ 
+ 		bind_virq.virq = virq;
+ 		bind_virq.vcpu = xen_vcpu_nr(cpu);
+@@ -1387,12 +1387,6 @@ static void ack_dynirq(struct irq_data *data)
+ 		clear_evtchn(evtchn);
+ }
+ 
+-static void mask_ack_dynirq(struct irq_data *data)
+-{
+-	disable_dynirq(data);
+-	ack_dynirq(data);
+-}
+-
+ static int retrigger_dynirq(struct irq_data *data)
+ {
+ 	unsigned int evtchn = evtchn_from_irq(data->irq);
+@@ -1595,8 +1589,7 @@ static struct irq_chip xen_dynamic_chip __read_mostly = {
+ 	.irq_mask		= disable_dynirq,
+ 	.irq_unmask		= enable_dynirq,
+ 
+-	.irq_ack		= ack_dynirq,
+-	.irq_mask_ack		= mask_ack_dynirq,
++	.irq_eoi		= ack_dynirq,
+ 
+ 	.irq_set_affinity	= set_affinity_irq,
+ 	.irq_retrigger		= retrigger_dynirq,
+-- 
+2.17.1
+
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bbappend
new file mode 100644
index 0000000..1c05495
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bbappend
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
+
+SRC_URI_append = " \
+    file://0001-xen-use-handle_fasteoi_irq-to-handle-xen-dynamic-eve.patch \
+    "
-- 
2.17.1

