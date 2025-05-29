
import React from 'react';
import { Sidebar } from '@/components/Sidebar';
import { Dashboard } from '@/components/Dashboard';
import { PlatformsView } from '@/components/PlatformsView';
import { ChecklistsView } from '@/components/ChecklistsView';
import { TipsView } from '@/components/TipsView';
import { ReadingListView } from '@/components/ReadingListView';
import { PersonalNotesView } from '@/components/PersonalNotesView';
import { UsefulLinksView } from '@/components/UsefulLinksView';
import { ProfileView } from '@/components/ProfileView';
import { RSSView } from '@/components/RSSView';
import { SidebarProvider } from '@/components/ui/sidebar';
import { AuthWrapper } from '@/components/AuthWrapper';

const Index = () => {
  const [activeView, setActiveView] = React.useState('dashboard');

  const renderView = () => {
    switch (activeView) {
      case 'dashboard':
        return <Dashboard />;
      case 'platforms':
        return <PlatformsView />;
      case 'checklists':
        return <ChecklistsView />;
      case 'tips':
        return <TipsView />;
      case 'reading':
        return <ReadingListView />;
      case 'rss':
        return <RSSView />;
      case 'notes':
        return <PersonalNotesView />;
      case 'links':
        return <UsefulLinksView />;
      case 'profile':
        return <ProfileView />;
      default:
        return <Dashboard />;
    }
  };

  return (
    <AuthWrapper>
      <SidebarProvider>
        <div className="min-h-screen flex w-full bg-gray-900">
          <Sidebar activeView={activeView} setActiveView={setActiveView} />
          <main className="flex-1 overflow-auto">
            <div className="p-6">
              {renderView()}
            </div>
          </main>
        </div>
      </SidebarProvider>
    </AuthWrapper>
  );
};

export default Index;
