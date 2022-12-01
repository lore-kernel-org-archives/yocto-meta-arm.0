Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7E2C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 16:03:34 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.47824.1669910608791524770
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 08:03:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=ZYFwwIKZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id c15so1284267qtw.8
        for <meta-arm@lists.yoctoproject.org>; Thu, 01 Dec 2022 08:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BNiA4wHS5CsAB/7IdkIR05w+EKnp0NIbdJcVM6YIMw=;
        b=ZYFwwIKZzSVlTl32yia54rsmcxJC/gJUhu+rhWeNHHn3soikxzgEt+ev38C+c1sUzD
         AWIkvEhLd3kF+x0n1kJ0UZV4NqeSlQXCB9uOAwgLo4ndOJiJR+PJwnkod2Mbp0cSSPpC
         OeZsvKVhQjuvjblu9xiaCuhy5PDIOC8/gS5h+aFMTIG0Ze79W7mv3VH9IbnwVVSsLRDi
         zX5iIlEchn2bkpGO8CAG0DaiXid9oGobrm8UvXktxFiZSC/mRC6M3Z75GETF8EKorVdk
         QD8KwHVB5N7yHJ2gnXVfXVo7f4id+wqjUGk/uoM2qMqGCFXZi29DD4BkaJu2Rq6hX/rt
         9vhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BNiA4wHS5CsAB/7IdkIR05w+EKnp0NIbdJcVM6YIMw=;
        b=aYmh8otS+0OEVrwKiDspDg5C3NxI2jLxRSuNJb7hwjtRZWytjMvA4A0T5e81R9PN8a
         X56yIH/7mrqz7XzNSgRjY6Vs6j7T/fTPKRcfqzCaUIat+gwOWiH7bGWBqP3g9FhHj6x8
         HdWmX3T/lMysyTyvEmcO9m1p0oP7+ClQz5+WurlPCNjg/YV9e1WENCTjCccTmJCRtcsp
         8UTnRFQY0OfPIYUCJPEqiqIlgdo3+oQcZ3H0bIi40OWbZg4LQUrn5hgdeuyOVQ4sgUWi
         EBwMd1cNGvxM0b2Hos25jzF8yVVEEEXE+kk2Kdal/5CnrT1mdBkocRq7Oj3/T7z7J7kH
         OQLA==
X-Gm-Message-State: ANoB5pniKvB2SW764rktOKP6pomnYEMgNAruJD6maBHdl07jlgepwR6O
	0x3Qr84ZC3a2OXUBcMS1f9+97hzzpuVXiQ==
X-Google-Smtp-Source: AA0mqf4lu61CTWWeY2cO1DdyGRrugOJwY5O9bnyXe3usALDeNU0QTKyl6gHiNKW4qWa19GamHl4tJA==
X-Received: by 2002:a05:622a:18aa:b0:3a5:1acc:3760 with SMTP id v42-20020a05622a18aa00b003a51acc3760mr45083707qtc.260.1669910607047;
        Thu, 01 Dec 2022 08:03:27 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id ff13-20020a05622a4d8d00b003a54a19c550sm2760026qtb.57.2022.12.01.08.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 08:03:26 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH] arm/fvp: Backport shlex.join from Python 3.8
Date: Thu,  1 Dec 2022 11:03:23 -0500
Message-Id: <166991060295.3823467.5348926910977842316.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221201124416.578360-1-peter.hoyes@arm.com>
References: <20221201124416.578360-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 01 Dec 2022 16:03:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4175

On Thu, 1 Dec 2022 12:44:16 +0000, Peter Hoyes wrote:
> 721bec25 "arm/fvp: Join cli arguments in verbose logging" changed the
> verbose output of FVPRunner to print the generated arguments using
> shlex.join instead of as a list. However, this function is only
> available in Python >= 3.8, whereas OE-core currently supports Python
> 3.6.
> 
> To fix this, backport its one-line implementation to a local function
> shlex_join and update the call site.

Applied, thanks!

[1/1] arm/fvp: Backport shlex.join from Python 3.8
      commit: 02b430d045b50d5e5cab9a52b786d1134ba17c19

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

