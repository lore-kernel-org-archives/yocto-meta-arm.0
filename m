Return-Path: <parthiban@linumiz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEECC25B79
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 13:35:01 +0000 (UTC)
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
 by mx.groups.io with SMTP id smtpd.web11.17089.1716471290305446338
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 May 2024 06:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linumiz.com header.s=default header.b=GdCTR/lT;
 spf=pass (domain: linumiz.com, ip: 35.89.44.33, mailfrom: parthiban@linumiz.com)
Received: from eig-obgw-6006a.ext.cloudfilter.net ([10.0.30.182])
	by cmsmtp with ESMTPS
	id A7UqsEaqDezZ4A8ansV1Sw; Thu, 23 May 2024 13:34:49 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id A8ajsql3BccVaA8alsC561; Thu, 23 May 2024 13:34:48 +0000
X-Authority-Analysis: v=2.4 cv=ObeeDATY c=1 sm=1 tr=0 ts=664f45f8
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=TpHVaj0NuXgA:10 a=oz0wMknONp8A:10
 a=R8SLqPNC7T0PkEvEDuEA:9 a=QEXdDO2ut3YA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:
	MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=EGOYTVpEyluCrhPcGv+mQnLVW+aA7jCQPTuoGIdgdBY=; b=GdCTR/lTqTYlfkG00YXQkNKzFq
	9Wz09klW9icSqxvpllWmII1UWfUErkgZoHK4WqvCX+iv9xSjAeVp+Oowpsje/umUhQUIrXlSPP6xJ
	vDn18kA3q7+lA/DjV8fhQb7o8HLbqeYn72wXFbbbJiZL9INwjDSUg/ldmnrmi8ujrDl+DSgYWEC0b
	4w+exW6M15RbaZ7e6cu/+uIsR+G6Qrl/mGlmFZWPjNF9hzhIf/tssTu4aPKyZB/naplOlYWqLR4rL
	swMAUPsR6MUAXqhtv6wl2gp6KojNXrtA0+5K/FMZRE2nDffZ2L1YBUYQu93s/FoT6bYZF9hFlql9C
	9lW7eIvQ==;
Received: from [122.165.245.213] (port=36728 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1sA8aj-003xiM-08;
	Thu, 23 May 2024 19:04:45 +0530
Message-ID: <ebb15d2e-db13-4f8f-a26f-b8c0477b394a@linumiz.com>
Date: Thu, 23 May 2024 19:04:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: meta-arm@lists.yoctoproject.org
Cc: Parthiban <parthiban@linumiz.com>
From: Parthiban <parthiban@linumiz.com>
Subject: EXTERNAL_TOOLCHAIN + systemd: Unable to compile
Organization: Linumiz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1sA8aj-003xiM-08
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:36728
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 1
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOMByL9r5BzFU8fCuKtElNskf5q8PbxxSSdOexTpoTgipCemiY349ok/nZLiCq0sQsezlsIIoOqHB88keXQiKdzEBYYx5czRc1466uUT9siI2m5wjnI6
 yzm8+sN8uj2UlqYm/fIeXjKI8gN8X9YTk9hcob7HXC0b8e4Axc3LCjCl5jPc0FJUkkSy7WKeD7tML3VL6kryoAWGTqRTfYdb2dMwBiRJG2rbBuvDGP2l1yP8
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 May 2024 13:35:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5761

Dear All,

Am trying to use external=arm toolchain with scarthgap mainline together with systemd as INIT_MANAGER.
With my current understanding, as systemd mandates "usrmerge" DISTRO_FEATURES, both the destination
and source path changes to same and resulted in the below error.

| mv: 'build/tmp/work/cortexa53-poky-linux/external-arm-toolchain/12.2.Rel1/image/usr/lib/libasan.a' and 'build/tmp/work/cortexa53-poky-linux/external-arm-toolchain/12.2.Rel1/image/usr/lib/libasan.a' are the same file

From conf/local.conf:
DISTRO_FEATURES:append = " systemd usrmerge "
EXTERNAL_TOOLCHAIN = "/opt/tooling/aarch64"
TCMODE = "external-arm"

External toolchain version: gcc version 12.2.1 20221205 (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24))

When I try to ignore this error "|| true" or skip it, packages compilation failed with libc linking.
| /opt/tooling/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu/bin/../lib/gcc/aarch64-none-linux-gnu/12.2.1/../../../../aarch64-none-linux-gnu/bin/ld: cannot find ../../lib/libc.so.6: No such file or directory                                                                                                                                                                                                             
| /opt/tooling/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu/bin/../lib/gcc/aarch64-none-linux-gnu/12.2.1/../../../../aarch64-none-linux-gnu/bin/ld: cannot find ../../lib/ld-linux-aarch64.so.1: No such file or directory               

Is it possible to use external-arm + systemd with scarthgap?

-- 
Thanks,
Parthiban N

