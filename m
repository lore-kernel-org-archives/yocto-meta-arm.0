Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F738C433F5
	for <webhook@archiver.kernel.org>; Sat, 22 Jan 2022 01:28:02 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web08.3168.1642814881430096567
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Jan 2022 17:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=M5iOYACU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id u3so12106597qku.1
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Jan 2022 17:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NR9ULwpltTyrPdQ+EXYhoFfxxr4IrcPaGgHH6Wh8fDw=;
        b=M5iOYACUdk3XRaQft8HhFpjNhE5ta4axj5EWsusjbzTAUMX1cii55x+uZyfgnMsvEV
         RF3L8IhHgzuXvexbqvCbTKtDPoxk5EJFfRhgkbd2Cpc5ZafUmJlP+5uL5vjRrlQvKdZf
         4r1KW7nlzaD7yqag4za/e2tp4ZmI2+S88cU45Z3TP/2wPxcmDpO4AhP2xjQKyk23K78A
         E1Oed84QtKAHwDQBa7fYCl4gWsle5pLsFKq3LQr/dlXMpAfFrdyuj6wOE95PjOk94JDr
         LSsqs3NNUDIA7DMv3MIWoiTfm1vHjYf1sNOV4sGlsTgXAqQWCnQK9R9T3w0rAAuD9ZSC
         1+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NR9ULwpltTyrPdQ+EXYhoFfxxr4IrcPaGgHH6Wh8fDw=;
        b=2LylYiOY+4dafN5uyZM8qcVoTpmOc9QR1uisY2xBUlgab5xPFlNL0ipS5Vuk63kIU8
         Ttby8bskH9kHRhktcaeyNRtFwg3NcZQYjvWdMN2Xzjf9MVEn/MjdrtX9JdNX0EES2ZY6
         f4mTcjEt1JW5aiLxT42sGOS5i85XKRkDwXe2IUxEvBxlZr1Bfh7B87dcpKOfgG5K1Yhz
         kl8Gs+O4LZGAORQqBPGb8lTL7Jkt4L17oHxmRSncXenZApc0J78xKHrl41FD6KHM3p4b
         9TWIl9OexIi3wU4iOkXyJoDnsfJLp9Ft8/nRcrTyYf0lNdNmCD1nws/IAloUzvuCiegb
         AuNQ==
X-Gm-Message-State: AOAM531+CPsnbmW8Kqk2yjmhDrfN52W82oYHAvo6O/qixSFGbX7+I31f
	+GNzJy+ThGICwGJzO5Fkr0DgUk/HTn1zUg==
X-Google-Smtp-Source: 
 ABdhPJw65cj+MiwBHUM4/5l7rSrfAEQb0tMnos9GbHZ40zO2DDSmvM71Gt/cMDVZyStYnaRV05Yn2g==
X-Received: by 2002:a37:a390:: with SMTP id
 m138mr4907525qke.247.1642814880392;
        Fri, 21 Jan 2022 17:28:00 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:a540:2d7d:9b0e:f036])
        by smtp.gmail.com with ESMTPSA id
 bs37sm4167526qkb.69.2022.01.21.17.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 17:28:00 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] arm/oeqa/fvp: fix scoping issues with the bootlog
Date: Fri, 21 Jan 2022 20:25:59 -0500
Message-Id: <164281475942.3585800.13770983945016032086.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121164159.3780055-1-ross.burton@arm.com>
References: <20220121164159.3780055-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 22 Jan 2022 01:28:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2893

On Fri, 21 Jan 2022 16:41:58 +0000, Ross Burton wrote:
> If wait_for_login() times out then it raises an exception instead of
> passing back return values, so the bootlog is never assigned.
> 
> We always want a boot log, so initialise it outside of wait_for_login and
> pass it in.

Applied, thanks!

[1/2] arm/oeqa/fvp: fix scoping issues with the bootlog
      commit: edf050394ecff2dccfafdc0bc2674311e2e7e0ef
[2/2] runfvp: fix undefined variable in terminal selection login
      commit: 254482284d4588532bd7b9d980193e3e41adaa99

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

