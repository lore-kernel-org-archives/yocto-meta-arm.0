Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D5FD4336F
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 15:02:25 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.74129.1730991745110625863
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Nov 2024 07:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Uyum5eNq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b13fe8f4d0so57562685a.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 07 Nov 2024 07:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1730991744; x=1731596544; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xp8l8V5VuEP0AkuHg0WgKi4dnpESU/+LLLGFBOflPeo=;
        b=Uyum5eNqiu02FPuJQLzpwyCfVDAuF8hek9Blqp6cnUyWgf+f7T6RpwjZ8BUAWFjjrS
         HWb1Sy3nWDebdUgEZ+Rxt0wABb2phlvETxiUyfCn2YVg1uiPbzYywffpg1MyxSbJnct5
         S60UhxE3++6UnQsqZcdRu/e3qaVOuUqkTMDyyEUD87rAS9OSpRsfbSJREp7Kef90ojqr
         Cuw4LZYBS0i6YGs67bdQzL3vMsSdnTRvqowlfKSpKB21PwtCPwG3pmu97RnPZOXItocl
         OGe8G9QzwWDvnQcfhN/Kw1BiVlcHw8nifVypTdzFt/qesRc+Jxc66nqEcKeZJNIqtLNZ
         BImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730991744; x=1731596544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xp8l8V5VuEP0AkuHg0WgKi4dnpESU/+LLLGFBOflPeo=;
        b=VCMf09SHsnrmDoX5kclhGqFgJ6CSjCA2ZX9kgG8/4MH/y7vzpiZFSUnDeFnSiaPlzi
         FBGLpJkwWbOXX0exD+/tk0ohWjuc9+dFNQd5200pora85qjCqvhgikFyxaOHkx1Ls7Md
         4PeKzgFlM9jfnLxWB98rMAH/SRPTsoTCS+dPR7Xoc/G+5mLA1RIw4gEBiTEAlPbpMI/h
         ixICCsdlTuJgm9nPf7W3Rqp3zuXCjZH68bEhmfVOP/9HxF61h8KVvJO0Ej7dJWSYt2Mh
         M5gSK0dmgokPuKXtlxj+e5yXv7EVARQY9IzpBows554lmcdOO+VAvheAKE1mAj3lX+30
         NyxQ==
X-Gm-Message-State: AOJu0YzLG8gqqyMp1Y/FFShBKPBzbzKo8RB2otlrtZAr9gUfByOaQQ8s
	Y97YygzgR36stBrwg3cfdU7ENteJtzPh8MiivuxQQOlFqruUZjK0UQf24nzdPjUe+DKc8K3tJTg
	=
X-Google-Smtp-Source: AGHT+IGWdf8+w9bz2Dyb+hr62m2XdxZej6OM/CgsPCTqnEiqiT92ktXTQ+FsOTv/pHd+z5HHpgs+TA==
X-Received: by 2002:a05:620a:44c6:b0:7b1:54f6:d1dc with SMTP id af79cd13be357-7b330afe460mr43263885a.4.1730991743910;
        Thu, 07 Nov 2024 07:02:23 -0800 (PST)
Received: from localhost ([136.56.18.214])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b32ac678c2sm70147585a.61.2024.11.07.07.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 07:02:23 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Cc: Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH scarthgap] arm-base/linux-yocto: revert interim 6.10 patch for fvp-base
Date: Thu,  7 Nov 2024 10:02:05 -0500
Message-Id: <173099172516.1350689.7547609573360944130.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241105181808.42156-1-jon.mason@arm.com>
References: <20241105181808.42156-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Nov 2024 15:02:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6246


On Tue, 05 Nov 2024 13:18:08 -0500, Jon Mason wrote:
> oe-core master now has 6.6.54 which incorporates this patch, so we don't
> need to carry it anymore.
> 
> This reverts commit 60fd47edd0f4757c11554848d717283f06c8c846.
> 
> 

Applied, thanks!

[1/1] arm-base/linux-yocto: revert interim 6.10 patch for fvp-base
      commit: d67a9b6070beedbebe597f6334c651606196e183

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

