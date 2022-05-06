Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B64C433FE
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 21:04:00 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.3330.1651871036365158683
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 May 2022 14:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=1NwcudL7;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id js14so6257291qvb.12
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 May 2022 14:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SzQY3tGk2/utGKN3POXW7LNOZlywz1OOQvFCDbG7mmk=;
        b=1NwcudL7RQmdxVO5DPyBuiArELcQQSDax7Vg6mXNLBKSjQP0hRixp1xhc1RKzV2qqH
         Tgcxr3+2fx94RPkv0oqox/fFpZMpc52dTkPPXn+ZH5hZUqit6WYFLCo8zJ9xVgh+FJ51
         /CK5S5cajATpX6oz6h3awkbk77RL7JvozO0Q1auYpCHxb+y0/KQNdbujGTpQG3FiuC3E
         H02oQrxowl2F6bmTa5Y5o/tXfz42pTc0ozZqpOJJus1L3TFaqb1mmp0vZ32DnL/EWSFW
         vL+SSQOE3HdNofbxUp7O25MHs5eQ34ZzO6ST8+gz452Ha/pxiaE+4+qa0iXwk4bZ9Pup
         zzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SzQY3tGk2/utGKN3POXW7LNOZlywz1OOQvFCDbG7mmk=;
        b=vX9HPpP3scTKMF9+lblmnnT8NIL0wuuRZeuVtljSTIsXWrs1w3OadO7MgZgxhKI2yh
         ENWW9nQqHhBycXGB1Ty0lrtLP1acmLYRlNTBW8i2oT2vnVwCDpj4rP9QLfvK0xFKUX2j
         a8VnOmNnZGAjPteNvwFHmPSdeoc5Y/0YeZRetqPYsB5OrF9Z2uuKukklFMNq6Ow0PiHI
         ZfVEBE1e3SJg8JsKdZ4Ig1ZcXZzIBCTRwTng75AAU27KkskC66UEvyYtKbM++15o3AX1
         h5niwUGx2w0oukWHGIg35wONT+qkmfQKhGq0ERYOZ+wDZ35VtG4QAw0edpCj3ysLPSMl
         VBlw==
X-Gm-Message-State: AOAM530zEhTzyQvZ33KhUS/A3VKC+GFGWlmmYuMxi6zfaLsN1ym0A3cJ
	MIaoNQfuwQ3APYNSa94j80kJ49cf6DGISKIP
X-Google-Smtp-Source: 
 ABdhPJwlUR9uNzfAX4s1tbVFpBd/sPYQgphiYHGGDHppREriIhjhogixegR1a7anXhTECIxKIpOmUA==
X-Received: by 2002:a05:6214:260d:b0:45a:e401:66ed with SMTP id
 gu13-20020a056214260d00b0045ae40166edmr3807867qvb.37.1651871035241;
        Fri, 06 May 2022 14:03:55 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 k5-20020a05620a07e500b0069fc13ce1ecsm2826587qkk.29.2022.05.06.14.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 14:03:54 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] arm-toolchain/arm-binary-toolchain: ensure toolchains
 don't provide any system libraries
Date: Fri,  6 May 2022 16:43:06 -0400
Message-Id: <165186978769.656860.14006231080523780449.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504141254.785384-1-ross.burton@arm.com>
References: <20220504141254.785384-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 06 May 2022 21:04:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3371

On Wed, 4 May 2022 15:12:52 +0100, Ross Burton wrote:
> Use PRIVATE_LIBS to ensure that the Arm binary toolchains don't provide
> their own libraries to the entire system.

Applied, thanks!

[1/3] arm-toolchain/arm-binary-toolchain: ensure toolchains don't provide any system libraries
      commit: c65eed7160341a97cd6908cb86def01f122ec4db
[2/3] arm/optee: remove redundant ${S} in LIC_FILES_CHKSUM
      commit: 80facbb124c9ea289a59a3b7214495cd62c758ad
[3/3] arm-bsp/corstone1000-*-image: mark these as corstone1000-specific
      commit: 28d6f6667b229922417e5494f49689d2940a7be4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

