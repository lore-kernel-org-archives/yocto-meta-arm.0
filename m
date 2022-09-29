Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CCDC433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 19:01:38 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.14238.1664478096599155872
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 12:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=jvh3KVv9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id e20so1233428qts.1
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 12:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=kODtuvEUPXmmXxCQm9JZ/83cOZSZX4fabrye7nCHChw=;
        b=jvh3KVv9BDq2tnE7/9hQ9B6vft6G2Gn+aunZE5pl7UQCok6+N1Gp4zesbHAovUEBiE
         evzL9TBinXbKayey6E3cF3Jz/djwlV0kTFsqBQKw4ytSjFpqRAAEd2Imy0XGDK9RPudU
         ncA1NDqBrubW0TnSjxISMonfamCjyX86C1PtQS+LWz1f1VF5mGqpka3Rf4q2AI/00e1x
         BtPXJXuqdcqLEhl0qQP1EuUTpvXM3p4t0PZNcdJMgHOtXxDUJW9RWS60a6nLzU2psRfp
         07PULDQf5qdWBpbes2APhhVNGAEY0tJSjlqGVE+VwHdElO8H364QXbZcrjHSTQnTF0w9
         lytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kODtuvEUPXmmXxCQm9JZ/83cOZSZX4fabrye7nCHChw=;
        b=YAkffXUsn1NxxHOogflebV5s1ga2CMi6YKEFFeEPIH41GwnVtG8xkNVvXgUtbIhMVj
         s6rYtLxQIlj8Z0HLD7rJ2emR+adLahDWNcvRBitnFdNyWFFqPVSrWnx1tTh0mzdhcAgK
         ctfVer7Ko5fRiQMvTYQu7yVrhGHeVHs8dH+IxrrM9uDEq9boDtYEtMotKtRkUB+eQOjH
         Z6n8GujpGF84QVIM6GZyhvl/s+uFMUJVXmgrxzkSFUlhYiELJ1iwAeiJKLm3pkKjs2e4
         0GUo3IgiAdQl/3GGKfTd7oMMaj5Ua3dtocJIMtZl3Ci0EmgdqmZV1Wpui7vYqRqYcM6k
         kzuQ==
X-Gm-Message-State: ACrzQf19MI8HUxNCdhmUuWHl+wwKzvSKerbB1M/Yc4Sj3csG1W3+KF4H
	S9yBSnq6+xrGDo1cupiJIKE8lRJsU0+HKA==
X-Google-Smtp-Source: 
 AMsMyM6kgWIhgFld5HdpJXSMZkL5UbOoyxzIkyaJKE6bXw33fhbwJ//0yGH6yXVpbJ9Q1cirXkxRHA==
X-Received: by 2002:a05:622a:5cd:b0:35d:5de5:b1f1 with SMTP id
 d13-20020a05622a05cd00b0035d5de5b1f1mr3821501qtb.650.1664478095349;
        Thu, 29 Sep 2022 12:01:35 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 br31-20020a05620a461f00b006b9bf03d9c6sm145321qkb.104.2022.09.29.12.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 12:01:34 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] ffa-debugfs-mod: Exclude from world builds
Date: Thu, 29 Sep 2022 14:56:32 -0400
Message-Id: <166447779548.3284601.4562876137106911771.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220913063727.2748504-1-raj.khem@gmail.com>
References: <20220913063727.2748504-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Sep 2022 19:01:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3875

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

