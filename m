Return-Path: <marek.bykowski@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD913C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 09:10:55 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.9180.1751015452247063942
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 02:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PTnTjkL1;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: marek.bykowski@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fac7147cb8so33012966d6.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 02:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751015451; x=1751620251; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EbUNKvCczDSyMCef95VUyaL1liJQibXMQwik0UHMok0=;
        b=PTnTjkL1ixJwJgPA2LvdCaFT6T3kQT6WK2VcK6FPjL+ATmYcC80ERTGrTGh/qEHr7u
         e81Bct3qMKen6fsm5q6YGf1KyPgZys6zTGa8QugRE20JTaAuLKh5YLB7wn9Cscl32hOG
         G9LAYv8NlBeeEhU1TofYrTbDq6UxGYTfHv+dSz4e+O/GGCq9fEP5gB3dtTElbyhs0FOI
         06Jx2XTFUEJPIKwRTQZrtW264uONlNKmawJD198L5INKKgkgDq05OeYCslIFp51QNSiD
         6JXoOqCz9ipzGNHThQnC718lBf1fxxoAdDjwRofGav9ti6J9RWNdV4IOMypCNUXm7JHU
         mHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751015451; x=1751620251;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EbUNKvCczDSyMCef95VUyaL1liJQibXMQwik0UHMok0=;
        b=aieh6PfJ1Myd1eVQgITSwZnroc2pHbKhiiU+6+UO/MkcR+FLJVGrmOq0xTW2M8AsrF
         PQudG3+JCjsc3wNYEFW3Ik5yptf6qKq897tbcnlZlabD5P9FcmT3F0WP0jmowT/29oby
         qNG77ope25wb+kZQRfHbNn1jc9aZWuQy8iCVX3GrMtUXdVkAhvEdOhPO6b+inLU3cxrq
         +n/0zatKhiU3ndZ15WXlggI1PGqLlH9bYq4L7MVaHwVTpekTB295qnOAq6KnoByH7PVt
         od896Dbx+drEAOjMy5Hbd3gWgy7DWgpkMxu2jXX37blS4nmodHIz5GPoKUfCrfw4d/z+
         8apA==
X-Gm-Message-State: AOJu0YzL98MRCtAO+mOzJYvT0nr+96w9eNU+GAiBWghwCd22FXh7rJ3b
	8LKK38J37y14ythS+ug0LsR+BamcmS1WAt9rrpywTBj+IqZoIPymqQBCxWXUHiun+Mq6IduNt9/
	JjIFnir6/yxqEoSW1sKAZLV/Qp7/X7Y4Y1g==
X-Gm-Gg: ASbGncttLKj3s5tcqwgCc+B/od0Xr/FTO6kNkLT44HieerOHH0UakDc8CogOin8RX4L
	eVLw91359uhXDLttoXgbAjMRbrjiimpwEwQDzh9+9kfsgoTzh5UpHPL75m8BL7AKHqxM6IYCKRK
	3DywQcVQioq0FaZeArnVmpfikRM5DInjMVW+r0TvdsuJY=
X-Google-Smtp-Source: AGHT+IHudjiHGuSj3xyGqq23glp78LPc7Dys9b3uJFnBEwRILQMNoSuWQfqXCLMCGdystvD1NwdU2XCsu30mTZOrrtc=
X-Received: by 2002:a05:6214:5b83:b0:6fa:c3e4:4251 with SMTP id
 6a1803df08f44-6ffffd79c3amr47391106d6.15.1751015450995; Fri, 27 Jun 2025
 02:10:50 -0700 (PDT)
MIME-Version: 1.0
From: Marek <marek.bykowski@gmail.com>
Date: Fri, 27 Jun 2025 11:10:41 +0200
X-Gm-Features: Ac12FXxmHGAYevrNtqD-hzUvRPDhQiNRF7EtkRNuO-M0B9z2hvaIviQCjVpPxLU
Message-ID: <CAHw2UgBkVKuaj4+f-TzxiLzgFn197zWLQgJipK_yLvagkHL10w@mail.gmail.com>
Subject: boot fvp-base in aarch32
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 09:10:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6584

I'm on the lastest meta-arm, right now branched off the scarthag a
number of commits before the head.

I'm wondering If I can quickly test-run the software built from the
meta-arm and poky on fvp-base in the aarch32 execution state from as
early as from bl0, EL3 in aarch32, not just compat mode for Linux
kernel.

Should it be something already tested/run or would it require some
work to be put in?

Thanks,
Marek

