Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04F8CE836A
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:25:12 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.59003.1727713511712975054
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Sep 2024 09:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=0GjjXFS3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.179, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e25d6342837so3431959276.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 09:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727713510; x=1728318310; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfN9mNqQQidZDrZ8wuqQjdaO7H8Y3aPlU8dOE7WfXuY=;
        b=0GjjXFS33miHInCW19sWe0N6ZpnKqbdmvWl+HKBOUo3BefV9eSNYYKl21MJpDuswgj
         GdLGfK6Sw/7FLTG5G/5QhNxVv43CHuTx+kFo7QfbvfOZti8+nlt/GZyxCOrwFgHkGvR3
         4bR9SpWwhgyESiEH5IdN03wlm6y2S5MoqJgaRRZzI4oMj1z9qbzkvW+8cEyGeqaZra1G
         iNEsyd0BEdLW7ygvUliu+aWX5hPKzhEvqcCMwtLmRb6cxYCWNtbJPAmT/Y8QmGd3z19Z
         eAZ46SsLwroFj5mLogPVH2YaFAy7siloAquwA3poyXHb2dYGgHWLpY75yBrm/BFnkR+n
         sAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727713510; x=1728318310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfN9mNqQQidZDrZ8wuqQjdaO7H8Y3aPlU8dOE7WfXuY=;
        b=jagHT21AfHXNkk2X/1HMpf/nzc0xx9TOWIezOnBu0f+0YqpPl3Tnkhy4WEC9mhAme0
         eygYQfmbLc96F6ajC/FB4VcBiRCr/IAbmnsDK8jSehM8tDRQpA1RDlaaPAxcfoolMIPM
         au+umb38o7aGeJPMhlL9SDSp+PGjOzpkZM+hy8liOxkBnRUjjp4qno46xqSlHY5HBn7B
         29S8HCWsqlMqp+ll9ulDHneIUZ5p749kHafKGHD9URAM8tNKXFyTH93TvW3xB+APkxas
         NgsRNTo2MQ/66m4h8WWJQVqfTM0j+YaEjF/IINZ98wbBFCxYYbDI2nSL6vkQTB3vLVKy
         W4Qw==
X-Gm-Message-State: AOJu0YzDCLyqdmZO8eZdjqLt0H5Lu4n4t90xp+LYNO99eCmwmkVfyLHH
	ZmD5OArirezJ6pEYVWMaTY7CSo2t1yfRnrHqRaMTEHen6SaAcfOHEI3EUxNHupPrT05rv2+xy2A
	=
X-Google-Smtp-Source: AGHT+IGoL+ysIJIrzskPzCAX3h61kx2RV8eriXc0dUtWROrn0vXk/s5KAkNWEbmRBdcYkBcNiAKGvw==
X-Received: by 2002:a05:6902:1884:b0:e13:d5e7:b1f9 with SMTP id 3f1490d57ef6-e2604b4f6a9mr9941005276.25.1727713510651;
        Mon, 30 Sep 2024 09:25:10 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e24530c6e8sm14459607b3.42.2024.09.30.09.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 09:25:10 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/optee-os: Backport the clang fixes
Date: Mon, 30 Sep 2024 12:24:36 -0400
Message-Id: <172771348142.724488.14166718096636379189.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240927174458.81044-1-jon.mason@arm.com>
References: <20240927174458.81044-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 16:25:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6145


On Fri, 27 Sep 2024 13:44:58 -0400, Jon Mason wrote:
> The Clang bug in OP-TEE OS has been resolved (see
> https://github.com/OP-TEE/optee_os/issues/6754).  Backport those patches
> and remove the forcing of GCC in the recipe.
> 
> 

Applied, thanks!

[1/1] arm/optee-os: Backport the clang fixes
      commit: 0d0b8ffac2ae7ad6cb50f4ac2b09349d89267edb

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

