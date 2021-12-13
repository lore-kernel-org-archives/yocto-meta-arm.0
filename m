Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0938C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 21:12:12 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web08.17163.1639429931702984848
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 13:12:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=5yKF/3XQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id p4so15138261qkm.7
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 13:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oCSKlEvMtPwAecflKjcQDMLgY33lLktW2pnYeqKmUJI=;
        b=5yKF/3XQbW2iJTY0Hwv0a0snVa+nPrSVu8VcjDGd/lGLz6aQXzz6uPjR/Vu+3faBLU
         3Nqt7IeO3/+uDxtJXvL2jPXSU4ug+wVA0ShXD21kaIINaTV95SxCyaChEnpWjauSNFMd
         lRyYbHzlqOiMDk5chAPo+mY+fcJNfsw1JkxjlN56sTW5a/VvJaHimhmE7IzBwer2vjrv
         8JYBlwnnSWqb+WDbLCLPhqgaUrY1zKhegBQZ8Plq7blHkefHuhyG9FTmhgvkyAcKAeKK
         0mLwx+s8JYEnJA+IvJDOeXn1uBnxDh1vpRUg8GqpHZJ9uldFQhARGzBS6jp+QegQkcwR
         6eBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oCSKlEvMtPwAecflKjcQDMLgY33lLktW2pnYeqKmUJI=;
        b=isDqt3mK99+RvsV/KXZytUCBlw5j+TrL+0W4v+shxjJG+5+HE7W59lTRuWSKwnOFD6
         KmVoiViWOlMjuc1rQ0s5RzSOzgMHV3Isfx1H3NsuZVK1fxwIOGGLA4K38+Qw5r8Nt2aC
         dEVpaJImGQH2RF6E96HiiGo2Q2S6dKrmTybah/4Xwn8rzUhtsv+OrX32j4yJm1vy3hrN
         sTypVZ+gkOE60a/Ht78GPfwYUf2N1DdNAYZKNJLIDNuGcydWaZPB6sXRnrj48/Ngniba
         elHnq+hdsuAYOSCjo0naofR2qZj0hcOiq6x23GUpumOnZSC4r/6kCO5u91nab9UfodfK
         +lrg==
X-Gm-Message-State: AOAM532GXRNW8nHc2oUKLPVNFNEsZxlr5DhEGM7hOz/ldgYjKGOS7K3L
	WhNI1btGCYkB6/FXLzFlPPFui+BXQk/kk+df
X-Google-Smtp-Source: 
 ABdhPJySEsBhJO4eD7sCkLVM/5Q0/5QZkVjsHnwnuw+0JOmImc7kmmt3NX5e9vl7lmY3hDvZFuwOBA==
X-Received: by 2002:a05:620a:2948:: with SMTP id
 n8mr694234qkp.620.1639429930784;
        Mon, 13 Dec 2021 13:12:10 -0800 (PST)
Received: from localhost ([2605:a601:a628:a600:d1ff:1ef4:15c8:ccc1])
        by smtp.gmail.com with ESMTPSA id
 o1sm2896835qtw.24.2021.12.13.13.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 13:12:10 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] arm/sbsa-acs: reset PACKAGE_ARCH
Date: Mon, 13 Dec 2021 16:11:05 -0500
Message-Id: <163942986493.20284.11040908601589489496.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211213142712.4080364-1-ross.burton@arm.com>
References: <20211213142712.4080364-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 21:12:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2671

On Mon, 13 Dec 2021 14:27:11 +0000, Ross Burton wrote:
> edk2-firmware is machine-specific, but this is a generic binary so we
> can reset PACKAGE_ARCH to the tune.
> 
> 

Applied, thanks!

[1/2] arm/sbsa-acs: reset PACKAGE_ARCH
      commit: b180c39f152218d5b7da0f33403305e98a21d00b
[2/2] arm/sbsa-acs: upgrade to 3.1
      commit: 93d5313f60f9edb856b61f80370dd5797c5e5878

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

