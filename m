Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4626AEE49A5
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 22:05:35 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.3833.1692655534626742317
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Aug 2023 15:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=2+Z1/xFA;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.51, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6bd04558784so2952174a34.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 15:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1692655533; x=1693260333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8pe75vbmGj38X81RVQFOr8kzy5VZ3yNc8y6dEQNt8o=;
        b=2+Z1/xFAY9jxZspjCxTLxt/gDRrIZIUMCYGKPiqlnkuW+VyEI3GeEjJ5Zj2ub0ynpH
         IH7RgpCKSsEiBnkFUi/sEG5F+3y8of5df26ywcolrTxY9p/OALxkCy/V/FUu824fzJhh
         msqKef0ISBIbZiPY5OpQUFy2609LzbSC9YokfOrZ8IG585cg8OGZhzUFkQ+MN9S8zVDi
         Mt4tBPfblr39fgK8TVb+D3K7o4o9UqSsSOIoJ5wolD1z7Cp0KPI1bc0BzQ8TAOCktVd5
         mJpII9aM7m/N8xUprwHIxvLKiDcHL13KkHNBg+nvZsmAZyKCPavWCoqC6U5EhbQoPy44
         OjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692655533; x=1693260333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8pe75vbmGj38X81RVQFOr8kzy5VZ3yNc8y6dEQNt8o=;
        b=E2sBXt4VmypNoWscdie++7cCPer4e8RxpPpBsCpTNUQ+FyA3QvjmgLZIbOUewLf2db
         6jv0NKOdL5O0iTxNIxMEp8Z7sC+fjfW+b6Rtuk6d61v4eAvwdfzMWHyJ6YJ+Z7LGTefX
         sSKVpoZI0gY62uqeN0ljnKPFI8Hmf6O/+xRYTkc58lpQigqwYiEhuGZvaiIgMGcSDxfv
         C5GkTSISnfQk8ItfujU/JDBE9cBgHCSnCD/j1+TTcqFTrM+l+/oe8/uk8PwbyXv2VSmX
         fmCD+f5KKxUgjSp1wlzUgwroy6W8hLkz/MyMzKLm+Y+Za4gB8MvRfs/QDGXDzOvKHl+4
         SigQ==
X-Gm-Message-State: AOJu0YwF/Gu9Rco4VcO2apWHAUlN+f6l0vrMuyRBiBUZObeTKAqr0bZK
	nKdJgxutPspESjMaZUeWN20P/bTv4IVkxw0+s0I=
X-Google-Smtp-Source: AGHT+IEsdcgX6H/muurnmIGTripgpzPufymWcNGH8L9Dq9WNK3FzEE7MTSKTC6u5sXA50LrEO+JRNg==
X-Received: by 2002:a05:6830:1188:b0:6b9:b600:589 with SMTP id u8-20020a056830118800b006b9b6000589mr10094615otq.15.1692655533338;
        Mon, 21 Aug 2023 15:05:33 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id jg5-20020a05622a728500b00403b44bc230sm2569287qtb.95.2023.08.21.15.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 15:05:32 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/linux-yocto: change defconfig patch for 6.4
Date: Mon, 21 Aug 2023 18:04:35 -0400
Message-Id: <169265547666.3638829.1386196546071000291.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230820215106.3643758-1-jon.mason@arm.com>
References: <20230820215106.3643758-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 22:05:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4985


On Sun, 20 Aug 2023 16:51:06 -0500, Jon Mason wrote:
> Use the patch that Mikko Rapeli is trying to upstream to work around the
> Nuvoton defconfig issue instead of reverting the patch that added the
> platform to the kernel.
> 
> 

Applied, thanks!

[1/1] arm/linux-yocto: change defconfig patch for 6.4
      commit: 5b8329a99f5fb6497575612ae677e03decf2e3b2

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

