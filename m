Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F5EC433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:01:54 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.6599.1645797713368176646
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Feb 2022 06:01:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=fvkyS25I;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id bc10so2454437qtb.5
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Feb 2022 06:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NiCmgnqjreXy2uQ+vKuKAnIxAeNtT4xCpYODigbT8qQ=;
        b=fvkyS25IdjgCkQbfclhW2IExrZENEgwEEXWppdoq4QZIDPXuLdCH9gM18yieRxM03w
         K6xeIbbBRUyED5lokDMAjMdzpG/93+8cxFf708DSAYlNsxQc1ia0kG5BVlss/mvhsqd4
         TslTP9Pio525yByzykpDmUx0/z/M4bvua2NBp0sQaQWvoHyVaQzu11VU8G14r8JqrDTR
         46SSFYL9+fh6EE9uM2UqRe2KwWOowL6/v8fsgWr4UCnHUh8UAihrS9gak1BbqduTxyab
         o44pIMx0rQyB+pTzbyn3xmvo0M2PBhjEOwSjHwhAWELDUl5pCT8S9n9uAQOpjjPF/bi9
         e+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NiCmgnqjreXy2uQ+vKuKAnIxAeNtT4xCpYODigbT8qQ=;
        b=dxmzhZ3zy2B+YuYu4YoADscwk1RVe976EYF1vF4b6zYfZoSY2H2qV3pq2kfsfpM6gE
         7sh3VwAEfzX2GL+bvePqFxOnbmiVQnBugDIWLM1fipW54piWzhN5KcU+6TZlIBSYGwas
         T4N+Zn33S/WREVTC2gnvh9bWDhT5ed/RWsbtT1Mn1rvYca9kRDqb/puL37Hh+ycJ0OrU
         htAKpsv6zV8g8WXma5rGkw+HFCGxnjIQE7zWndQrs3s5C6iPlj3LkQ/WtC0kV7eHfdHX
         bEbegnUZhJPAkdmsA0AgXX27sztgTg8S63oVJtICGaApFhSe48itY8JgBHsSb4sqzhOR
         kFvw==
X-Gm-Message-State: AOAM531gEuF9dHTyr8bSFjQrvsqWHN8vwT7jbxvf9mRjKsgM6Ql+cy9U
	fnyUpyr8zD8Zh3AhHkHS4U9Tb1sKGAUPvA==
X-Google-Smtp-Source: 
 ABdhPJw7pP7cjV2s6v4ic2Ib0EmNSryythWPHgCRHRB8LRC/kuNbgETu6HdOB3gL2v2tvMiM41TbIA==
X-Received: by 2002:a05:622a:148d:b0:2d6:b8ec:70bf with SMTP id
 t13-20020a05622a148d00b002d6b8ec70bfmr6746054qtx.520.1645797712196;
        Fri, 25 Feb 2022 06:01:52 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:ec60:a2ee:9645:ec8c])
        by smtp.gmail.com with ESMTPSA id
 194-20020a3706cb000000b005081e1550c8sm1244802qkg.78.2022.02.25.06.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:01:51 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	diego.sueiro@arm.com
Subject: Re: [PATCH honister 0/8] Add UEFI to fvp-baser-aemv8r64 using U-Boot
Date: Fri, 25 Feb 2022 09:01:38 -0500
Message-Id: <164579769793.11432.13251656037232284176.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220224112244.1521611-1-peter.hoyes@arm.com>
References: <20220224112244.1521611-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Feb 2022 14:01:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3069

On Thu, 24 Feb 2022 11:22:36 +0000, Peter Hoyes wrote:
> These patches backport the following updates for the fvp-baser-aemv8r64 BSP:
> 
>  * Add board support patches for U-Boot v2021.07, and bundle U-Boot in the
>    boot-wrapper-aarch64 binary to provide UEFI support.
>  * Update boot-wrapper to more recent version and include patches to boot
>    U-Boot at S-EL2.
>  * Align FVP RAM size with upstream kernel device tree.
>  * Enable the use_real_time FVP flag so that the counter increments using
>    the wall clock.
>  * Update documentation, including a section on the new boot architecture.
>  * Fix the PL011 and SP805 register sizes in the device tree
> 
> [...]

Applied, thanks!

[1/8] arm-bsp/fvp-baser-aemv8r64: Fix PL011 and SP805 register sizes
      (no commit info)
[2/8] arm/boot-wrapper-aarch64: Upgrade to newer revision
      (no commit info)
[3/8] arm-bsp/boot-wrapper-aarch64: Update patches for fvp-baser-aemv8r64
      (no commit info)
[4/8] arm-bsp/u-boot: Add U-Boot for fvp-baser-aemv8r64
      (no commit info)
[5/8] arm-bsp/kernel: Use 4 Gb of RAM in fvp-baser-aemv8r64
      (no commit info)
[6/8] arm-bsp/conf: Use real-time clock for fvp-baser-aemv8r64
      (no commit info)
[7/8] arm-bsp/docs: Update fvp-baser-aemv8r64 docs
      (no commit info)
[8/8] arm-bsp/docs: Minor fvp-baser-aemv8r64 updates
      commit: 94682c6d1d1a8e719f2aef52e9c835315bbfa73d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

