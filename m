Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11DFC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 15:56:18 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web08.20952.1666626969396466536
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 08:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=YpOk0wNJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id x15so6786755qvp.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 08:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BKER7rbhPSIVgq72c95WV7AZvQ8pxVZ60kKA9c8VpWE=;
        b=YpOk0wNJbDcSwbRIG1KTlZsAV5elEO6UL3N+g1r4zBp6xWiLlW8Mj7TAqvOMuiygC4
         O3JPmnYWgrF2uKWAGM1dBVH4MPwpv/ei80d0xJcmYldM9eHPUMBMNH+YY9xwZu/mwRLO
         9bWVVuWbp903BTePiIcEe2KoYnAh5LtMnOx8NfVhgpeLsKOKe/aF4OlWBljysLgGcinR
         ux5wICcQL0dKm130oTEJG2sBCWZDGY3fbaKjJ3Gvsr4qJJCKtsUegWDYq9iFKSUA2jK+
         vxQqJDIpkJHZmlaA7tPd5IH6CliZTjTKEgGvBjDbbrumbikDjUlfJd90NO7Nj4V0Iaxy
         MFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BKER7rbhPSIVgq72c95WV7AZvQ8pxVZ60kKA9c8VpWE=;
        b=i4BWFO9tuAeCMsQiwHQL1+xO3/P1EkUAOqJNzJjYKKKSdkAb0IvorS1cm9A+xK5YtK
         Ep/MyUYmSF8BieTKIuHS7ESMipbjhDnxmWUnBth9iZIvVlfyY2eEd451xaHT0mAud5w5
         vsOD6vtz3fU+HleEDgwJt84x1O7RwsTthkyMtPTWhf3NWBKvNqBSsxND5Lvuq6OmXFdO
         kv0FYlQqFJjL5YzfgKXhylvfnjxuMW4Wc/V7N4NYW2wjr4HKJtx7oaASx61m3eaz/kfg
         fR8jSSAKiV/NOSduLYQtCNLKee//NoHqlZQvN9e5YDrCNklbv1pkmFN1qDKYFFXtcTv0
         j/Gw==
X-Gm-Message-State: ACrzQf3cUvr8K7BedYsngjvur+oSr8c+wehcw7BsY1b4DY3TSneJnpzD
	We3yosyALgcz0JNUx+nPtvrl6SpH+xfMgQ==
X-Google-Smtp-Source: AMsMyM7RbV4PGq8a/LErQztWMSPdzWqc1+JRzKs339kGmwGtmXFVelr/fch11ScPjpXEe2KAyZMajQ==
X-Received: by 2002:a05:6214:1c8e:b0:4af:8570:8878 with SMTP id ib14-20020a0562141c8e00b004af85708878mr29111715qvb.33.1666626968020;
        Mon, 24 Oct 2022 08:56:08 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id r4-20020ac867c4000000b0039cbe823f3csm166361qtp.10.2022.10.24.08.56.07
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:56:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Mon, 24 Oct 2022 11:56:06 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm kirkstone update
Message-ID: <Y1a1lvqPoy4oi7dC@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 15:56:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4029

meta-arm has released an updated kirkstone support tag, 4.0.1.  The tag 
contains 47 patches from between 03 May 2022 and 19 Oct 2022.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 4.0.1) with a yocto-x.y.z tag (i.e., yocto-4.0.1).

Thanks,
Jon

