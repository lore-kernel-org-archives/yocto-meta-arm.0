Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E63C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 14:43:07 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.7276.1714660986346137496
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 May 2024 07:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=wZGYcodD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-790fb2b780dso340755785a.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 May 2024 07:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714660985; x=1715265785; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qY3JyeanLDkV1FphguSOf8E/JumifS2dmgVdb1LWbcc=;
        b=wZGYcodDodnhWswdvxvjTPnbBECjlg59sMJmilK6IEj7AugpU06zwd3S87SUyrB+kK
         euUeKI45L/c0xWRmy9NBIpmIoVfJgMSHbe/mLebdOj87jKagjfJZk0HxPfKseUYb1UjQ
         osb532zWCGtOsWZXHpgRsMR1bXKjW6murja2w5zxkyJgDSmBdKHyqZ0avJ50Q3z5uMu1
         qYudqNTqUEmWpZ6cysE79NBWcJhrRbX54TUGE73wp1/LoCRljAwv9pDN8uevml5tVhAF
         6cR0aDQjeR5lyZt/ZFAJbDSYZb2CLwu+EBT5MESmIkIRVJf3Nz6HyEYmCOWckvtDzuYT
         /3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714660985; x=1715265785;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qY3JyeanLDkV1FphguSOf8E/JumifS2dmgVdb1LWbcc=;
        b=JOiYOGujiyKEntsuR/WJw5Qqp5M4MWTxmt/OIQAvF+eCqidp9x7f2AN3TzAaD16iLw
         vRg1aT4E/lvxRJAX6jUHvO+sdnx9+Efa/hVqHgiNlCpblo5jJ9LTumY8vZ0B2OEOGWoX
         +6nenr7xy5Ynjk1rvEzr8/r6Eu6hxucTv4VJLTaRtKkOm0sJ+MnUO81fsQvrt/gTrWU8
         JOYi3wFkA4G1zk0Hk8zSy9qTdJfXemxYtjZRO2ap2aqgfjAYl2myoVElRVgxhxJ8cmEy
         QIAX3jXfk0rVsXZXm1zopA3HkqawKivS6QbBpX0YwZ9lUzqzQq8fpjHGTgH1Y0kZ9CVt
         m9oQ==
X-Gm-Message-State: AOJu0YyjF3ZnAden4GxeoexsCOd2qxWdNUjt0zQTyKWQmpW8XCVLIRh9
	TZkAFdNS/VdSpBZJnTpN1g2FyOa+FngeuOCwRLmwEjhaT7lkpSHdMJUPHAq2GSe6+jGkgKFc174
	=
X-Google-Smtp-Source: AGHT+IEyGPwXJI2GWcwn6miBX/gbjtctBkKqcTV+X/fffrXwSO2nzylz4hKcsBzLXlod3hVw1I6xXA==
X-Received: by 2002:a05:6214:f25:b0:6a0:b3df:6601 with SMTP id iw5-20020a0562140f2500b006a0b3df6601mr6652497qvb.40.1714660985211;
        Thu, 02 May 2024 07:43:05 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id y17-20020ad45311000000b006a0eb265a6asm395837qvr.65.2024.05.02.07.43.04
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 07:43:05 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Thu, 2 May 2024 10:43:04 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm dunfell update
Message-ID: <ZjOmeFNiDgRP5GWh@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 May 2024 14:43:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5689

meta-arm has released an updated dunfell support tag, 3.1.7.  The tag 
contains 1 patches from between 27 Nov 2023 and 27 Nov 2023.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 3.1.7) with a yocto-x.y.z tag (i.e., yocto-3.1.7).

Thanks,
Jon

