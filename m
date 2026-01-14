Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB302D3901A
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 20:33:57 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20403.1768422831648180030
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 12:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=0wUSF/qR;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4f4cd02f915so1395941cf.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Jan 2026 12:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1768422830; x=1769027630; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BviAOpsftApUK2652neeAAoUSnu8q+Gnl2zt25I6be0=;
        b=0wUSF/qR97LnBjk/fsgvk6UH/7Qd7p6QZjHvXgxrS0CN+oznWv+DnjKt0rCNwXbdoT
         CXg9HEA8owXMymruNWJ15sxeA873uId1Xe3emlckNxEKADbWR4uMDzxUXX/QtjniPzOh
         uKYtR411El0+NYR6J5STLl2KZOjcTlm2RD5CM6nEuYh8QS8sb2vgZ2jD6hcYRMywfuTj
         R3XTrkOaL22Y0RJMbrx6WWoaVCtETAa1Dat+Ku8gUwUub0r0K5SkWdVlAyXihUBlvion
         uB9fOGT5aSwOycy9mckIwOKugI+aUlsht0hiOEiM3EBx/zCmTxxTCGlT1DUIhJhT0KV6
         oshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768422830; x=1769027630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BviAOpsftApUK2652neeAAoUSnu8q+Gnl2zt25I6be0=;
        b=Fb7zPaxSc0vnnSyyjlMSlVHqKKT7N35wL+6BLKRZ8EojemXP18Bl+qY6/zzrE26WgK
         NU5Y0S6eKQzb5pd6j1Lp1uExfFg9+1pdDqQGDVMjnwykoSlsFJ2e/923+fcWXyzCqm7L
         t7u3g6z/lDqM/OhPdtjEJvhOKsw/BycEuBnoTANcABOcX2JpPD6e0FqA3Za39wkm9Cg+
         VPVMhl4eQUbJGS6U2taBAwco/RW2W3G7JHI3bymRBHAVAePcoKAo1EilovJiGhSAx3VU
         A96J+ABsSSZ0IPIBaLudoMGdn7DFWm2tP2mBS1nVRuGB7CrqZssvWRKfM92AG5m097fp
         02Jg==
X-Gm-Message-State: AOJu0YzdJRnRN8/7XLjl0Rj+fH3/ohZqm6u8ZpDeBwj4VWaXzftS4rq1
	x26vLDl5Et16HG0isTbw8Mde2jRCq/3tcKhzAW/Vi929uTyGW6ViNlo9hVFwmAVbzccqj6QIixD
	6Uz8=
X-Gm-Gg: AY/fxX5jAA/Xh5SrdG2dOdKLOnr67Yubh5tjOTuZTFgOOCSfpln3NuMuT4DGVkQzHMv
	o6KoTYLqJOF5O1l85M8n1RZPJNh4Uu4MLnEx+WdyzYEdBI7VevPIZXKf7dXbOrXu0Jjqpq1BjDK
	JJiory1pIWHOaB7UfjyQC1LrFnpuwkjtZ7RDnJceWmsq9UloADsMr/Yrhi1gsHRGDMZnuqivlL2
	QjRdfHx8/TN9dp9a1S5VLqzHZDk39dKQZVmJ//5CTc2j0MvV2uOjQBe9jBYVRu22adq2ZB/+Dhw
	8Qzb/l9CgB5ddlpMOBiWE3rD0AeKRWuuJInQCgTlTErn69W+Oew+F+vAs6Jy5CIh0n2ecAQ0EBX
	3Zs4ORhI1CTv5otYkZ7Ywmm9OljRj11wxbGuKhqApPD7IA6UMM//dLqcK/EYi8QWcJOZvJ5N5ht
	UR
X-Received: by 2002:a05:622a:1a87:b0:4f3:5961:3208 with SMTP id d75a77b69052e-501481dc867mr60647001cf.12.1768422830331;
        Wed, 14 Jan 2026 12:33:50 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50148dd75d4sm21075611cf.2.2026.01.14.12.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 12:33:50 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] CI: work around xen failures until fixed upstream
Date: Wed, 14 Jan 2026 15:28:02 -0500
Message-Id: <176842248234.3731607.9114491106555842715.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260112183243.3270090-1-ross.burton@arm.com>
References: <20260112183243.3270090-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Jan 2026 20:33:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6848


On Mon, 12 Jan 2026 18:32:42 +0000, Ross Burton wrote:
> In master, xen images fail to build as the xt-masquerade module is not
> built by the kernel. This has been fixed in the linux-yocto 6.18.3
> upgrade but that is not yet merged.
> 
> Until it is merged, we can temporarily update the kmeta in our CI.
> 
> 
> [...]

Applied, thanks!

[1/1] CI: work around xen failures until fixed upstream
      commit: 341a0fd9762012622699aa1431b96a50a65bf16c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

