Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052DCC6FA90
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 15:32:14 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.8968.1663947123970789476
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=xkzdgq2d;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id a20so236873qtw.10
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=kODtuvEUPXmmXxCQm9JZ/83cOZSZX4fabrye7nCHChw=;
        b=xkzdgq2dPrrwTNXayNhKV131cV9fjgyn9SAe1uGUeD675bY/opu9oCt9UEROlMr4nN
         /awBRLTDaj5a2dfZvqSUSWjBtLUy3YrHzDJ6n7nrd+uJ13LOuK18BfKEfQevbh0BgSrf
         jQPq3lVsvfugDGuIfVcpuSLcqKQceD5vjm8QzHznMpfhmY91i4ebaNMuuuTvUwpYA5Kk
         Ne8lFC+qgJpvLn0bRVycFEDG0wVVUpwI7xkcs6O7XE6dSrn4Znia6DDPgZnMOZW6ZZjs
         FrUFqcBaQ2a/Ud0YkPi4Pbp4S+Sxb1i01a8f6n7ul5sbdxEq6D2Q0wk9ehhwxVFsy8uO
         TqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kODtuvEUPXmmXxCQm9JZ/83cOZSZX4fabrye7nCHChw=;
        b=jcvYZX8EI4Upwq6bBHnEi++vQv7dTYJG0NZppKh/qXo3MHjQ0B/BO0LQuHuzjDJ8g2
         B37npzn4opykFvJTo1mnlzEtoo1ki/ngBj9U8EJmS4QrqNyjAndvpCO9kbQ/A4CtAYqo
         veFofyPc0NiTXLKHy3Lh6BS5Phb2ycs1Q8OFBdRyvnNHZqmJEQ4fH5bGx4nvY0G1aZjI
         fCKNTjgx3vBiE287A3F6q9tj5wbFYqh7CyRuw7jHwgu+gNT3n8/8N7tLvtslPPbzDzKe
         +Pikdc6UuZD0d4Ymb65iLr6jd0mzOpw4kcf6lqBLrLGZsgju6+MZw8Um9oNm0EZET/Jd
         aWrQ==
X-Gm-Message-State: ACrzQf3WFRU9BHNpWXvmtd53xL4/zM2kyHpCXGedeHkxQqbIxR/JCHpR
	gFqRQJunbzqe+TQr069x8wMLHkt1IfLmZQ==
X-Google-Smtp-Source: 
 AMsMyM7CxGLfoaeCjPvz73S8EHagqkIfLPRY6WYMXMZp2oCR51om8PXm2IdTshBDdyhpteJsQIwMfQ==
X-Received: by 2002:a05:622a:192:b0:35c:f7df:5d50 with SMTP id
 s18-20020a05622a019200b0035cf7df5d50mr7485955qtw.603.1663947122708;
        Fri, 23 Sep 2022 08:32:02 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 fd6-20020a05622a4d0600b0035bb732ac93sm5843839qtb.88.2022.09.23.08.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 08:32:02 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] ffa-debugfs-mod: Exclude from world builds
Date: Fri, 23 Sep 2022 11:31:00 -0400
Message-Id: <166394706727.2062239.11395338908482076885.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220913063727.2748504-1-raj.khem@gmail.com>
References: <20220913063727.2748504-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Sep 2022 15:32:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3822

On Mon, 12 Sep 2022 23:37:27 -0700, Khem Raj wrote:
> It installs arm_ffa_user.h and so does arm-ffa-user recipe, lets not
> build ffa-debugfs-mod in world builds since it does not appear as much
> in other package dependencies as arm-ffa-user

Applied, thanks!

[1/1] ffa-debugfs-mod: Exclude from world builds
      commit: a0658a6682a537330f5619962504e675d7540f40

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

