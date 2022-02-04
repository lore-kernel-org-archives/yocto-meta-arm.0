Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFA7C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 03:57:08 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.5197.1643947027616785158
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Feb 2022 19:57:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=zkxna60c;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id 200so3867129qki.2
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Feb 2022 19:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hfAzTuPULnV6LmXrdnAFLK/+RSiSGEScUO6zGcQM5YY=;
        b=zkxna60cg3nWBrnvkZjSEEaOKqUQGXDEzZkdXvS8FYHG32EsGADzoVVxo7LI0O0VAm
         Oi4hguz9lQEJdtsHH42uJ0wXX58k5b0nzpARd3BIxdaoVsJB4o6zkRjmRmnixWNtOrsh
         JOAj3u8PdpI4PQ5JUmJHbCKoNz61jxCklTxrtMmYRITp0NSxyyOvWJqGSEw2j0fnWC/8
         bBLE7aYt8DI3fQ5z6cPLUd1gI4OI7SK2CF7QcfwRdOjOnYCLqhIDo6O8bULN53Jqb5lC
         sTN5nmv5Y9//CeSRvUtE/slike4Jsfgq52Qzy3WXnRwwcA1vnnBhgFDin9kQf8Sj7nUb
         N+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hfAzTuPULnV6LmXrdnAFLK/+RSiSGEScUO6zGcQM5YY=;
        b=CUnXol4l4nbLRQ4rY1kSw/jagp+Kl96veJDG9kTA9e4nnkv/ksZ+rjB10LMrVVmbr/
         CzGRHC6oIREsODa5q4NFtd0cynqzSdpzagio2JCzgC1/z+YQpGwy6Sv/Kl8f95qZ7c0u
         9YykzEZA5hSoeahpNWGcRb8EqWKZ3qwTQewommlUdHrnusaJ/8xw3rZTp++SBKxxHICB
         ebt4O80YgTfMZgNtV0ake4AaiFEti2zAKtTN83ltUCIEE1VLUrBJSLHekd9C7n0waOdf
         TNoUHqNkgfaz68Ucw2VtoMuXbI+jb/yWTjIiRX1kK6wwnZ23pyC7pF4O1KZnVhk6TOX6
         KgfQ==
X-Gm-Message-State: AOAM530dpRferzNtrPm1aWS3tJHAyK1WQAosV+LYHFI9aRw8a3f4ELN3
	PpaM6hQSAmX3DF3aWeZ5Tv15abqGO+EKTQ==
X-Google-Smtp-Source: 
 ABdhPJz+fR665vmwVG3/9kI2xY2uWXTWySWLHRg78GggPMBlXr8Sj4CtHq6rbaftnb6KZsGx51Jf3Q==
X-Received: by 2002:a05:620a:2450:: with SMTP id
 h16mr603907qkn.429.1643947026515;
        Thu, 03 Feb 2022 19:57:06 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:9889:122f:c76:bcb3])
        by smtp.gmail.com with ESMTPSA id
 x16sm496958qko.17.2022.02.03.19.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 19:57:06 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH] arm-bsp/optee-test: tc: Limit xtest to a single thread
Date: Thu,  3 Feb 2022 22:56:16 -0500
Message-Id: <164394697721.2886371.11077409812788518933.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220203165135.26872-1-ben.horgan@arm.com>
References: <20220203165135.26872-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Feb 2022 03:57:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2947

On Thu, 3 Feb 2022 16:51:35 +0000, Ben Horgan wrote:
> When multiple threads are allowed xtest will fail and
> leave the system in a bad state after repeated runs.

Applied, thanks!

[1/1] arm-bsp/optee-test: tc: Limit xtest to a single thread
      commit: 4de50f4c870833a2f459b3aa194661fef993eb9d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

