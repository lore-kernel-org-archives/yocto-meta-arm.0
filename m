Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D10C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 17:03:33 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web09.103.1635354212757767141
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 10:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=peB9LSk2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id 19so1527636qtt.7
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 10:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:date:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=mFOIjFZW1vVEndg0ZV6e5uioNQvCJpPZj8HEm1LBUX8=;
        b=peB9LSk2KfiCkj3SdJYM4Aw4lGq4Ze6H2KB3L1LHgpLFyNpI/a9aMQiVWF9O9jGxv2
         CH7+OJbD3bL/rqmSVt4BXpuitvbAZ47PmTAYT7wae/EqmXvatnifTl+WfI/Z5116XttX
         3peQ/EAUBl2RdI53gNYivcTa8SDAdKzGIiEbySnrwD1vd8kUzXumM0eNL6LW1YpejHAX
         UC/NRAkLUZovlL5EA70pNCapL0bHHDqx1pbfKg+8LGWpU4/0uReQLC/+Aofr932PMXOI
         pj5GljZRRTHKkV8v9gKb2gHTewhEptGpgifi7EMCUTHx/YdZmMEhoEZ8PlnX74Lr2NxF
         Jwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=mFOIjFZW1vVEndg0ZV6e5uioNQvCJpPZj8HEm1LBUX8=;
        b=pq/lkZaCj77CanVjsG+JrFN7/Fp+Eqiw2BvyOMpnluHhaRJFMC1yu+BqnMB0czZs4f
         anO4nc4B5zAo2KuXODVQaU9ak/K4TnfVLluN7aNDWJ8cUWgiFkz538aMv1ryKCc7oIQx
         H1WPH5ZYyjUZWS6YfCNGzLhy3bn2zz7WUAFmNc6iSPBpaCy1vUmwpuYpqiDIm2mCmRBk
         pCO7y13jn8WOw5nmhuXeEax4Xg26HFtxU7buMwws/3Us4m9/OrdJp55PZ0XfrwZ2DdnA
         UmF9e0EPN61Tkda6kt1Oogm7KfEkep4P7//bdVHGnFdspTMUGwxPeCRf6rHC/Udb8svF
         ywqQ==
X-Gm-Message-State: AOAM533yy4xXF2FucuIRsF5GT7QWp0ioYq0INGZdJXHnCJfyoV/rO/Kp
	2LhGQ98viS+SBW0yZTE9ruqyWRR51AvQlQ==
X-Google-Smtp-Source: 
 ABdhPJyE2PquEJVHOBYLopTMaVkyyhgwkDjV0bLewln92ENlvoH7lZEFcbVO76YCwqLwX6bWIwzkrQ==
X-Received: by 2002:a05:622a:1c2:: with SMTP id
 t2mr34167703qtw.113.1635354211618;
        Wed, 27 Oct 2021 10:03:31 -0700 (PDT)
Received: from localhost ([2605:a601:a618:1500:40aa:523b:a9b0:877b])
        by smtp.gmail.com with ESMTPSA id
 e13sm315626qka.117.2021.10.27.10.03.31
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 10:03:31 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Wed, 27 Oct 2021 13:03:31 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm gatesgarth update
Message-ID: <20211027170331.GA22747@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Oct 2021 17:03:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2309

meta-arm has released an updated gatesgarth support tag.  The tag	
contains 28 patches from between 01 May 2021 and 14 Sep 2021.

Per an external request, we have duplicated all existing "numbers only"
tags (i.e., 3.2.2) with a "yocto-x.y.z" tag (i.e., yocto-3.2.2).

Thanks,
Jon

