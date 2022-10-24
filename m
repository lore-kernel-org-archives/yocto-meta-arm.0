Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831D6C38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 15:27:28 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web09.20658.1666625239590921908
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 08:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=Bv0EI+UN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id s17so6234452qkj.12
        for <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 08:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PTSopfkA7X4hXKYeZQcQgI/2Nkkbb0h1U7pOmvzYyvM=;
        b=Bv0EI+UNK5YrE/EV4EQRCWDAtwm24VWNlDq9uEhEUlnNZTkRVqsTiBae/+Fn4NhX7R
         P9AwapL1bha2H2jsQ+4v98OTdKIstrowVQuc7c3N9JSbiFwKgV0R8lOeeWKWRHAgT5Pj
         FUVtuIxZ1if+dVi0Q9nD4czcwc+rvJ3Ydhk2gq43iSF1QmmxMmCyiqwsHLokq41LczNn
         BshiQwTFsrY6BHPawgrNf4POVW/56f6iG03JBj/At+C9pYfkl4tFMnK6eqyfxfNn/kzn
         +yf2BTFGhzOgaB+BrDn+zecbjETaeS+CoteSjg/eL3eov+qanrPSzSED9EL9My+69Iom
         PGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTSopfkA7X4hXKYeZQcQgI/2Nkkbb0h1U7pOmvzYyvM=;
        b=cWAx5kSyyEf6phhnU/utXf6Z6Matz5B9B74snsaUuR8bjfC9bchaRIraU0JJEPph91
         0LY8tulWkTMa5gjWDV0NFcLKF7T142cAk8qNyEC1ksckyCpfcmeoiawtnIXTrKjDKTvp
         JraR+Z8BSTRhsp0Ao/+InPYeODt8g4Beqtg34YL4kNDo50qOVYLU0fw23CT4VgKwna0H
         5wk6sfW6YNHTnENYyX/tu4+Xp60Ik9mE+OzKIWHdirTscrdvaxxDujpjOJ6AeAu+3TSg
         lMCLzD/vYslAx9x0ITWdK4pxCufBMkv4vvfP316eW+jlX8qtYPs272ezJQoMhiJgytRn
         8O+Q==
X-Gm-Message-State: ACrzQf3Ay1VH6tZ6QaquJX7VkPKSMREPg9zVlRS+4kjbhnDitGkeR3+8
	f4GvJJri/IkgkfGl9VJvOiBuuS4DyrBRQA==
X-Google-Smtp-Source: AMsMyM4JM09tI/iliEZ6Rgt1HizE0uENLpp4kfdNisjX96NcoEgwfrb/9P3ncthORMftgBBdsfEe7A==
X-Received: by 2002:a05:620a:2443:b0:6ee:b1f0:3798 with SMTP id h3-20020a05620a244300b006eeb1f03798mr22465964qkn.444.1666625238209;
        Mon, 24 Oct 2022 08:27:18 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id a25-20020a05620a16d900b006b615cd8c13sm99290qkn.106.2022.10.24.08.27.17
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:27:17 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Mon, 24 Oct 2022 11:27:17 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm honister update
Message-ID: <Y1au1UGKjnREknE8@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 15:27:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4026

meta-arm has released an updated honister support tag, 3.4.2.  The tag 
contains 4 patches from between 05 Jun 2022 and 07 Sep 2022.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 3.4.2) with a yocto-x.y.z tag (i.e., yocto-3.4.2).

Thanks,
Jon

