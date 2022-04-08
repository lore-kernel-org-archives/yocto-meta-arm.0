Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3281BC47084
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:36 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.7519.1649432236219047910
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 08:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=qJ4J5WL2;
 spf=pass (domain: burtonini.com, ip: 209.85.221.46,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f46.google.com with SMTP id w21so13524849wra.2
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 08:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wwnuFn5T2fmWBHhR7/tXZKpsAEhy8KDpzGcl+M7lRwE=;
        b=qJ4J5WL2f6jmZSYInqoFBfSn5SZ/UYLS+AV39mzIYTg5s1xmDuz+uLLNl91eWuMLQJ
         UV5Hq3CMNlfKSNU/xN+S2/PzAiu7px2izBeOT0sQAmENrR3wtFRqvT+RUlUIOV2czSE/
         MrfzVvrA4UcjAJyG7h6rLZMfET8ty5SO8UnNZ1/N/pBFf3Bc+YA8289sp1tOhbKEucVN
         qpkpxnLTzuvyA8hVCzkeQcbYGc+RoU8JLVREu49AFXfEU/iBKtrAqMySkIzvHag8NUiq
         UUFokcnFi7Z5nP14RuFkiui476v2XbrM5hTjfWmCt7q2UyRx5ZKqbGgpsOAKtWD4wks9
         oUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wwnuFn5T2fmWBHhR7/tXZKpsAEhy8KDpzGcl+M7lRwE=;
        b=4AJB0bhTvWOITEJbwZpK885ANOOAlPoUJFD0VduRCHURPr8B7DYd1nkyKU7xlFdXup
         lIDA56ChQtN3uWfS3fzv6XKz7/r4Yi4Gntd4lFTmyW4Od/i/3Ue2LjV/ctIQ1DKfZpeZ
         LE8Ph8QCAvi5LWlrVXJBE8ZmmilGRjYeLzEXk/d7XILdkta4T+gaMJ6EnEnWD777Y17P
         lRGkjI29o2HpZmZG78Jr94fkiStoRz/6F2aSm1L4RcvLJVq+Y78mHJyvtpwzuYkyFjzW
         YmKBpDpUazSnO2NAmJltxZ+z/LF5BESSmfSMxgWbB+WMdv9ar8qVdVJiUTqiKIPscRVO
         7A6w==
X-Gm-Message-State: AOAM5325HABaG2nDgVbIbskr/Q5+OVfcmeBNZ+sw/WAa+XZEJfLAzq/L
	n8HY3tYb6Dd//EK8noS5EyORjrfH58Ft4d1jjc7Q3A==
X-Google-Smtp-Source: 
 ABdhPJx6bXyh3NpeWnuD/KPXiEILY188m56Jf64NJzAyFnnkDC0qzSh4XjTIKa5tiEbJVKAFga+Cjd0L9yWTNj6hReY=
X-Received: by 2002:a5d:47a8:0:b0:204:72:7051 with SMTP id
 8-20020a5d47a8000000b0020400727051mr15483734wrb.451.1649432234481;
 Fri, 08 Apr 2022 08:37:14 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CANp-EDaiKQQpeKqB_tXek5+3arUHn0vm6-DhQ-=QBKxP9+PSwQ@mail.gmail.com>
 <CAAnfSTvbnpbe5a=KdTxXiw1F0F8-jtKufSc2WzW5bCUQ3iGR0g@mail.gmail.com>
 <CANp-EDb4kHbzAwZwR6+XrCa3QwrsvzkF8QmzDTEmgUPYR9xBYQ@mail.gmail.com>
In-Reply-To: 
 <CANp-EDb4kHbzAwZwR6+XrCa3QwrsvzkF8QmzDTEmgUPYR9xBYQ@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 8 Apr 2022 16:37:03 +0100
Message-ID: 
 <CAAnfSTuckkywvUeRkw_xJP3=4LV_rXS341ghS+3honNcmsYwrw@mail.gmail.com>
Subject: Re: [meta-arm] CVE exclusions for dunfell
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 08 Apr 2022 17:09:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3266

If they're definitely not valid for master then that's an acceptable
reason to avoid master, but explain that in the commit message.

Ross

On Fri, 8 Apr 2022 at 16:24, Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> On Thu, Apr 7, 2022 at 11:19 AM Ross Burton <ross@burtonini.com> wrote:
> >
> > Yes, but they'll need to go into master first.
>
> It looks like master branch has gcc-11.2 currently.
>
> Both of the CVEs which I intend to exclude have CPE that only matches
> up to 10.1:
> https://nvd.nist.gov/vuln/detail/CVE-2019-15847
> https://nvd.nist.gov/vuln/detail/CVE-2021-37322
>
> So adding them in master branch will have no effect there. Do you
> still want them added there?
>
> (Aside: hardknott has 10.3, honister has 10.2)
>
> Thanks,
> Ralph

