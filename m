Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF951CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 13:03:50 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.14829.1760706225613207669
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 Oct 2025 06:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ChImYOKa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-891667bcd82so41133885a.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 17 Oct 2025 06:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1760706224; x=1761311024; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5HFt8H3NU7plMuSvZI1WxwBPccy+ufkryskCxKVXlk=;
        b=ChImYOKaR5NCtWf37B4hxYidKCUB/l7Dhhnmte9RrV0vaPcNts08XG1udso1fnl0o+
         X0sCXXXXHQwYjN2KS2gBvZIy2PdoCGRdXniUW3yxJqo4vRuB+KN8XzrQ3RMhr9aN0DRq
         Y7vhotVefOF/oR19pitptTFvSlZ8LYQ85zU0TFBRi8HtzNKTN52q3it96hPIYRYDwl/+
         tIK0aSC1s1Rcdq71a+mTpT94dMEiQvoV4iiQFbiDgHmVZVt8mOdl2lARb5LDAvl47a3B
         SyQlIoUorJyQ6oq0f5I9gR8O/Dcy8yziuOnO3dE/t34spJA41IxWLW0odnOWqthqSqZA
         kA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706224; x=1761311024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5HFt8H3NU7plMuSvZI1WxwBPccy+ufkryskCxKVXlk=;
        b=cP3/tfngrpc2NXXda3d5MVSK4PjMls8GA0sfgipj/ggW9len8OhsiBNVWx1AFi/UIW
         ceCEtwFbrtGV6lMhk2e6a8EG+SLnRAqchPVC68gPW89uDJjn1O9ercFd4ivjYKN8uen6
         xvsS4KV/9/qp8PZ2eemV6LrolVibkwFUVYw6kHT8520jjFMYqyKF8vC9ZWEakKo8CyZS
         A5Ocy29GJReZgwXZCtj2lB9aFfiPNe2LeEiPwt24lzCqvhv02NBcG/JzZQBR76XMSynp
         DNFVV2ReaDmbIKWz9vuLCPltIeU3yJQCXhO9IhRkSQpjLV3gC51Z07HjuxnzUEJpec9R
         Rwng==
X-Gm-Message-State: AOJu0YySpGhOK+pfApQbCoJeQeu0gh+kOhe74VncRP2Vck4o/LUYXxU8
	qGLOfrcvd35su5RBlewYh9SRu8Rk8mFPPLdgvctUhFh95LALg9g7i6nbQR/N6Vf4dR9oo8135Yg
	wVbQ=
X-Gm-Gg: ASbGncverHYAW+N6nNO+96LvZ5x4JkaOOo7SqVNzZPqQx4du2ajgzNP2OO7tg/f5/I6
	Earw4nn0ec0mk8aUlK+ZoqVdzGKlNVSB5HYFL/JOtsqOwFH3CX+czQsAd3lxC7VHzhhSKQrc1pf
	E8MD8y7YR7td57SZh7co6/u01dJjWZzHQ16k+0w0mAqafLU/c8/NmxpV7+wIRkmBX4xQ6kYU0+j
	FglhF42p8ku8rQiBUGtvtKFQTLzpuPJ0icsZo560klj/etTKmsvKeCI8NaoKyo/RwOvLFfeZywA
	TpUrcKm6YPBaW/nT0johaabkU8ZkMt6U2SKBzThROG63aBYMj5OfiSPkZuCANtRWlMnhp5FvObh
	l7RkhlZxDhPkyGzTH1m3DnQt8xm67nMBCU8QKWekb3mpi9Ki/wIIkciQzvcChIyZON/k=
X-Google-Smtp-Source: AGHT+IHliuW+IgSAZLZjqIUXyaPivjTLGgTs0RJOr98b28oyhGu03Ax1LukIM1XcTchME+mqzxb+QQ==
X-Received: by 2002:a05:620a:7009:b0:891:9763:a05a with SMTP id af79cd13be357-8919763a378mr29141985a.32.1760706224170;
        Fri, 17 Oct 2025 06:03:44 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f3587279dsm422912785a.9.2025.10.17.06.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:03:43 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Frazer Carsley <frazer.carsley@arm.com>
Subject: Re: [PATCH 0/2] corstone1000: Fixes PSA API Crypto tests
Date: Fri, 17 Oct 2025 09:03:29 -0400
Message-Id: <176070621154.1945921.4366829281555151049.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251013154912.55363-1-frazer.carsley@arm.com>
References: <20251013154912.55363-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 Oct 2025 13:03:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6736


On Mon, 13 Oct 2025 16:49:10 +0100, Frazer Carsley wrote:
> The PSA API Crypto tests were failing on Corstone1000 after both TF-M
> and Trusted Services were upgraded. These commits fix the problems
> caused by both of these upgrades.
> 
> Frazer Carsley (2):
>   arm-bsp/corstone1000:trusted-services: Fix psa-crypto-api-tests
>   arm-bsp/corstone1000:psa-tests: Removes RSA tests
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/corstone1000:trusted-services: Fix psa-crypto-api-tests
      commit: 88327727f959419d1ce2282b83040a3b9e63e00e
[2/2] arm-bsp/corstone1000:psa-tests: Removes RSA tests
      commit: b5881d25e61acb5e854967de832ae67980535fe6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

