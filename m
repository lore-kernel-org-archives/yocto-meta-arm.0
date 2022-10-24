Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 875F9FA3740
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 15:27:28 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web09.20659.1666625241215673092
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 08:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=yNdW3AV6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id o2so6244409qkk.10
        for <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 08:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=keVexlWsgrXRZiMu0QBwT5XJU61EPwqxHeJ6dYruUe0=;
        b=yNdW3AV6NjtjYXVGz63AWUeOqkK0Ya1LMUjTjB1qa1o7wN+GRCHqPM/Y2HgsoGSWSs
         BzBsNUAOdvYKoHAQtBhL5vo3N6THagkD4tt4NSFvwYBmdV5Cd8bear4tnG9DdxsyX2wV
         Ps9O6ktfQlhvVszkzOvRjLwxkzMDZ/naGvhGJnxG2qsAKGwK8AlcolO+BkQouxsVfcW7
         Zc0IqECiTUFaNP1UGhfonTxWhavsJ+OL9BcAG9yY6gqzQ1SZBEMcJ7l5pn00dTotLHhw
         +i1psFelCnLMkPJpgeXDmcaGzPaj7krAuVoLIqPLDaHQv/8OdW79Fh7j8LFsA7+tSuxB
         7gMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=keVexlWsgrXRZiMu0QBwT5XJU61EPwqxHeJ6dYruUe0=;
        b=gyZ73Pq7CSf8b9ezDCtE6Ltxnifz3kTALVg4aJR7tKQQfQErl5I8WDq5xmYQ+m2BKU
         bFMqdAVvDEKADQ/C9PFZocS0ljSlwiPQtjPPMyQN+GH/PTAH5waNnjLYU7QA2Q/csqL4
         fvCAplq2mhErDcZluXUJBxZBFskYK5LHzlfrHchpbwDcB7CyybkJxQRidbYINh4ddPsb
         L9yAhJUfVomJEe5EitAqaB3eHKcqZoqTxgGd9E1qg6FpQi/wOZOmFfMRi5T+6ouy6IDN
         dQaEa2DEld/FagEUDP89FKB34wXKbWeHKfjtv8CqrMlkw7LHX89zkLHxw0uQN9UYfi8R
         iFmA==
X-Gm-Message-State: ACrzQf27aRpbz8yJIqXR//db1omMOlYo8JhMcAzS8OZZNZlvEu2/VKpK
	sFcWMVUIYFWK8z5SHY95tQFIeSAM9alfew==
X-Google-Smtp-Source: AMsMyM6iw0HIu+i4jpRtAWRgj1wgmRCVdtFIAn/phlXJq3fBsTLUnCetgJI77G11TPDghoFr89vmrg==
X-Received: by 2002:a05:620a:22c5:b0:6ee:881f:b1eb with SMTP id o5-20020a05620a22c500b006ee881fb1ebmr11423883qki.534.1666625239898;
        Mon, 24 Oct 2022 08:27:19 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id f18-20020a05620a409200b006ce515196a7sm175941qko.8.2022.10.24.08.27.19
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:27:19 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Mon, 24 Oct 2022 11:27:18 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm kirkstone update
Message-ID: <Y1au1otwUxr0iAFO@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 15:27:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4027

meta-arm has released an updated kirkstone support tag, 4.1.1.  The tag 
contains 46 patches from between 03 May 2022 and 19 Oct 2022.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 4.1.1) with a yocto-x.y.z tag (i.e., yocto-4.1.1).

Thanks,
Jon

