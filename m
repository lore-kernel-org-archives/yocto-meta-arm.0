Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64729D4A5FB
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 04:03:21 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.321.1768536194877842421
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 20:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=hFowu8vN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8888a444300so16753256d6.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 15 Jan 2026 20:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1768536194; x=1769140994; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uCIm+npcgwtEH1iauNMEjevP+eCF9X8vmnMAq2W7Evs=;
        b=hFowu8vN7x3DS7ByUXghaYeXqbtCNM+HSBkQ3B/+8stSWs8eo2ZL1tZHRWqeTRSrRq
         t6rAPNIddmSQ1o2STk2eUqh4o7t6RR/Rkhp1RRpi//H95BHJQ71aJvjjgtBjc97c8PtB
         syfbEgllAleDuGdiNL2Cpu+BvzRSLQGxB9m85VF+7xksBwMgAOH5BFARE64ZuQjFU9PW
         Qm7iLMNtkkADKeKL/a99oPOqv/Ar/YThxh6/z3kPL3X0TTQEf9RCB0PP2mpVM2r/esDE
         a5wsBAHoWCdwSEs6dJYKdFxuRDhxHza5NF6WmRB7jntcVUUM5rqb7xqUadPzz8esg2yc
         WQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768536194; x=1769140994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uCIm+npcgwtEH1iauNMEjevP+eCF9X8vmnMAq2W7Evs=;
        b=hbnFunoMN25mfFS1QYeOLhIUlFtKNh+lnwluLwbtg64u4xW4TnIt3ykBdv9frvORPI
         YyEGUytXJOpiB6U+DusZm+xJNEv8kXYn3YmWtQB0uxeDGC5Z6Xnd8uO9Ye0RTbeU7mV6
         THudyVA+UEpmq7CYEAEjr6jVizDn4CgTXHLxdjXcdTS7VnjhfGJEB6w6XF225PU5z7B8
         cteH3p2bzxXrzI6mjPlM4fVkNQZ0GwSYfFhkxKVs0VGq4TcjyNxt5/8NmW3VNr3BtCmV
         ebxDvFzQNJrYkNqZ3qCfwesbZlEHWo7DuoHWa05UM/0hOlge4+Q/JD28nmMM6Gvh9lF5
         WIcg==
X-Gm-Message-State: AOJu0YzHTq0dwBqt6tKoDodr/9d9JCgAFmK1ru299MrSkmK5QLQpJwr5
	EQwkpltK4uQTdXu09NwE1VmQlL3zLfyVElm0uYsl6WqNEYcYWFbjzdaIXdI8mOoqrC+PnT7gVU/
	Cq/Y=
X-Gm-Gg: AY/fxX6wj8bFquj26VZQ7KhetlyjCG/27PXfpO8h/keMeTjJaO4MpBLY9lQtcOHWRc9
	0JOzYuX27ZWC4bBdWRKW6S5AvjUg/mRSxpJa8l+GmCgcgXBR8Muqh2powYFVSaGBrWxAKygZolN
	sA7bIASN6IUKO2hYGHUzR6N3jHZxnWMqB2+IjvU93tK4YM2F1eygA+ElPxS2aiVKWukgjXxibd8
	0E57zMukxU9eJCM2gGmm1f+vxqMhGG7yeYD4va1a3ntFYef7gTzPyvgJBGV8Uyt7CuPS8dUtJzv
	XryG6VCZZ+bG1+a5C6n8HWqoykL/kK9XUYsaG72vvQykK8/fpk/fLoE+vqILn+EkArYgZqGraV9
	qPKziHbCeC2aE2B0zyPVisAZVpJbBYa9GYYBVVwMxwUCMOm/N5S62c0Grx0bxomVHXpf12NJrPu
	8kPB2DGGrbN/c=
X-Received: by 2002:ad4:5f05:0:b0:890:8aef:2b3f with SMTP id 6a1803df08f44-8942ddb8c33mr27855676d6.65.1768536193704;
        Thu, 15 Jan 2026 20:03:13 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6049d9sm13766986d6.23.2026.01.15.20.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 20:03:13 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/u-boot: remove upstreamed fvp-base patches
Date: Thu, 15 Jan 2026 23:03:05 -0500
Message-Id: <176853618596.2093914.15673412823815594412.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260115224537.26252-1-jon.mason@arm.com>
References: <20260115224537.26252-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 16 Jan 2026 04:03:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6853


On Thu, 15 Jan 2026 17:45:37 -0500, Jon Mason wrote:
> 2 of the fvp-base specific u-boot patches were merged in the 2026.01
> release.  Remove those, as they are no longer necessary.
> 
> 

Applied, thanks!

[1/1] arm-bsp/u-boot: remove upstreamed fvp-base patches
      commit: 755287ed334e64576b653296b11afd004a5e275e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

