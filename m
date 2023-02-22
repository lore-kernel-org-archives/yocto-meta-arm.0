Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41591C636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 16:39:58 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.13834.1677083994639493996
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 08:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=xnlXf4fO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id b6so1970301qtb.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 22 Feb 2023 08:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mfx0eo56fNrFCqV5/pHqQ8dnfTEdssnSngqvHzdP4aE=;
        b=xnlXf4fOkcnI/kDGcDyRowyuQYLqueXwh2mxNeGvMIIWwYoZNsPm5EFp1z9T5LMTZO
         OwygSzYDMl0I6+8IvgpIAO3Bwrm7Hlart+5apVY87yJ7uKabvGUpdj6e17ajrHz1aLiR
         4VP2bEvfmzetMMEzeMcKKGSx9Z8+F4SdBX58OhsPRwOvlpBIir/UF1Z/MB9fXGTu8DrM
         T9HfCSlgT4/a3vcuisD1gKFL+VfHSYE9WGC2ZPnV+Pukqvvu+wdp/Q5dxSnA5sFAFaRH
         NyU0L4wqEH5dbDqvmQBlF8pfbiuUK4MAwlaxmdFcOfhhX3E72nSfO0hy861CeOZ9HTxr
         cw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mfx0eo56fNrFCqV5/pHqQ8dnfTEdssnSngqvHzdP4aE=;
        b=FGZgWc6xOEjboFxYPQOWdiHmVbYQE9El7tgheWnpZSX284nN64pI/uGhOJMGawRgPu
         bNof7lrTU9o3BFRF7i0MonYzfE6R7R0ffwUPuWMmJnNgeIfwYbv61DCnWdZidFzUhd+a
         jdwst7lBQmUdcCxNOJ4IVLtikfmp9MnZjQZ+c8Bpk4zCls1yWUDZ1ztfZUlpQ5ELQbHO
         q1iSnn+Lre1y9+ov9V3Wcf/lSUgWIKepnCSDALoR88TQKaCouT7nsNN/UcUluwcFk82I
         3VCM34rh9kpw38KwkRNzbHr6IbupCm7woeRT0SeeV/rkS09JVhxFz3cqRYZ67Ufn+bIm
         CN1g==
X-Gm-Message-State: AO0yUKWYxijFtkXlBX6vMFzqaJX8WMZDQaYpjDbZfzabl8sz1inksXoq
	nTTTHzrMJ2iKnMykC+e+HwkUbANEMsW1RVp1
X-Google-Smtp-Source: AK7set++dGKUljDgI8xf9bokClGWIopYIMO5BpqS+H+Om5nh+ec/95lLQoo3JzwtNTKSORTpbrhp2g==
X-Received: by 2002:ac8:7d42:0:b0:3b9:bc8c:c216 with SMTP id h2-20020ac87d42000000b003b9bc8cc216mr13896078qtb.33.1677083993332;
        Wed, 22 Feb 2023 08:39:53 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id e13-20020a05620a12cd00b007423c122457sm663625qkl.63.2023.02.22.08.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 08:39:52 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] arm-toolchain/gcc-arm: add missing Signed-off-by tag
Date: Wed, 22 Feb 2023 11:37:33 -0500
Message-Id: <167708385325.3620198.3243801414030120548.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230220154841.43053-1-ross.burton@arm.com>
References: <20230220154841.43053-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Feb 2023 16:39:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4446

On Mon, 20 Feb 2023 15:48:40 +0000, Ross Burton wrote:
> 


Applied, thanks!

[1/2] arm-toolchain/gcc-arm: add missing Signed-off-by tag
      commit: 69b73682b3b7c691716e6baaf50fee9a98548ef2
[2/2] arm/optee-os: add missing patch header
      commit: 047be751caf26735bb1de2b7d6ad296d9dbe7ce9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

