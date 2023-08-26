Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB4BC83F11
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 16:08:56 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.11105.1693066132577441056
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 26 Aug 2023 09:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=Q71X6jZd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-76f036041b4so33396985a.1
        for <meta-arm@lists.yoctoproject.org>; Sat, 26 Aug 2023 09:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1693066131; x=1693670931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVXJlLxUksUxd1UxI1wz0hXRaVpVj+qYuwlTRneKBXo=;
        b=Q71X6jZdKHmdHV6+/FAOD8nNBH6157fj/LpMfPTAoMaGZ/YowTJad5gOUlXoPStCW4
         lBup5htz7t3BuBB1aBZ/dUSCV9MolxOf3NYrFgVu51Z9J5MtP5OSkoMzbQcbOzPLyfMq
         KQbTV14Xv8qVw6qu48qcg2jow2i3j1pXJa8Cfx7o1wi7CtmOzJEyA02qv5tjWLZsCI8k
         b++nif68iNwhOr0jOMOsUc3EGJ+RaZSVEigkSLGJCG9y+pMrHefL+dCvPrJWLcD8kBEP
         3SlagNDLS8gIYHcxuGkj3NVMgSog1XXIZ/1hg3dUNeIJndHWq/yAcPhXtFMlSa9UujHa
         Fdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693066131; x=1693670931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVXJlLxUksUxd1UxI1wz0hXRaVpVj+qYuwlTRneKBXo=;
        b=kjoMKkBPQEWBgZ7dt66jft5krgv1ZRvDqw9cWk9Czejiq4Ixtlrg0ZEmfTX9hXDm2j
         a//TkJwJsg0Ucwji6bHJCPfhSTyH5O6Y3J4HkGNv9h3jrOiK+vk0xNDNOqWqSXi7ckpn
         Tn/l01f5BviaaFr4cPaOEhh0bC1yBFs8E5HGAZ0GwGo1H+Zcr7ubLbCmBIuKnPqUB5/o
         C+p7A6/kBRWgaBk+It0Bv76tfZQGdCizuY+KWQoVSfF5nj/CkHnSDdpUTn9sWm+T9ghK
         mUZ31LU5joH6yfW81D+izrVU7VSqGBL7Ole9HW8EfZMSzIMTPObi+a1aobHehj4phKjI
         t+Zg==
X-Gm-Message-State: AOJu0Yz7aqKyWCbdBhG2T0ZShCBwqxYDo79lSgA00GzHFJLmhjFp1gKT
	45s+y+Q3jh99XduyFE2rOnFAGAh+y5Y58Tc+azI=
X-Google-Smtp-Source: AGHT+IFIT8SjW/Cp7eq/M8xbR7Ac0wL7MTspMT9FKufDBODFh0xXBq//hQ+0qe1fMgRdZ0M5Bq7iJQ==
X-Received: by 2002:a05:620a:2403:b0:76e:ea58:3c2 with SMTP id d3-20020a05620a240300b0076eea5803c2mr12513599qkn.33.1693066131108;
        Sat, 26 Aug 2023 09:08:51 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id b3-20020a0cf043000000b0064f523836fdsm1331651qvl.123.2023.08.26.09.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 09:08:50 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	emekcan.aras@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/optee-os: corstone1000: Update optee-os v3.22
Date: Sat, 26 Aug 2023 12:08:31 -0400
Message-Id: <169306611266.2418.6426315589816845189.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230824133032.43870-1-emekcan.aras@arm.com>
References: <20230824133032.43870-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 26 Aug 2023 16:08:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4996


On Thu, 24 Aug 2023 14:30:31 +0100, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <emekcan.aras@arm.com>
> 
> Updates optee-os and aligns with changes in v3.22 for Corstone-1000.
> 
> Emekcan Aras (1):
>   arm-bsp/optee-os: corstone1000: Update optee-os v3.22
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/optee-os: corstone1000: Update optee-os v3.22
      commit: 41cec3e05394340a41d318c80768ca6a662c42b1

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

